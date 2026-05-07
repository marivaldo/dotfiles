-- Find project root (directory with Gemfile)
local function find_project_root(start_dir)
  local dir = start_dir
  while dir and dir ~= "/" do
    if vim.uv.fs_stat(dir .. "/Gemfile") then
      return dir
    end
    dir = vim.fn.fnamemodify(dir, ":h")
  end
  return nil
end

-- Cache of which LSP each project uses, plus buffers waiting on the initial check.
local project_lsp = {} -- project_root -> "ruby_lsp" | "solargraph"
local pending = {} -- project_root -> { bufnr, ... }

local function start_ruby_lsp(project_root, bufnr)
  vim.lsp.start({
    name = "ruby_lsp",
    cmd = { vim.fn.expand("~/.local/bin/ruby-lsp-wrapper"), project_root },
    root_dir = project_root,
  }, { bufnr = bufnr })
end

local function start_solargraph(project_root, bufnr)
  vim.lsp.start({
    name = "solargraph",
    cmd = { "solargraph", "stdio" },
    root_dir = project_root,
    settings = {
      solargraph = {
        diagnostics = true,
        completion = true,
        hover = true,
        references = true,
        rename = true,
        symbols = true,
      },
    },
  }, { bufnr = bufnr })
end

local function attach(project_root, bufnr)
  if project_lsp[project_root] == "ruby_lsp" then
    start_ruby_lsp(project_root, bufnr)
  elseif project_lsp[project_root] == "solargraph" then
    start_solargraph(project_root, bufnr)
  end
end

return {
  {
    "mason-org/mason-lspconfig.nvim",
    opts = {
      automatic_installation = {
        exclude = { "solargraph", "ruby_lsp" },
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        ruby_lsp = false,
        solargraph = false,
      },
    },
    init = function()
      vim.api.nvim_create_autocmd("FileType", {
        pattern = { "ruby", "eruby" },
        callback = function(args)
          local file_path = vim.api.nvim_buf_get_name(args.buf)
          local file_dir = vim.fn.fnamemodify(file_path, ":h")
          local project_root = find_project_root(file_dir)

          if not project_root then
            return
          end

          -- Decision already cached: attach this buffer immediately.
          if project_lsp[project_root] then
            attach(project_root, args.buf)
            return
          end

          -- Decision in-flight: queue this buffer and let the running check attach it.
          if pending[project_root] then
            table.insert(pending[project_root], args.buf)
            return
          end

          -- First buffer in this project: run the check, then attach all queued buffers.
          pending[project_root] = { args.buf }
          vim.system(
            { "mise", "-C", project_root, "which", "ruby-lsp" },
            { text = true },
            function(result)
              vim.schedule(function()
                project_lsp[project_root] = result.code == 0 and "ruby_lsp" or "solargraph"
                for _, buf in ipairs(pending[project_root]) do
                  if vim.api.nvim_buf_is_valid(buf) then
                    attach(project_root, buf)
                  end
                end
                pending[project_root] = nil
              end)
            end
          )
        end,
      })
    end,
  },
}
