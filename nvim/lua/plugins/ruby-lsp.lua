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

local projects_started = {}

-- Start the appropriate LSP for a project
local function start_ruby_lsp(project_root)
  vim.lsp.start({
    name = "ruby_lsp",
    cmd = { vim.fn.expand("~/.local/bin/ruby-lsp-wrapper"), project_root },
    root_dir = project_root,
  })
end

local function start_solargraph(project_root)
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
  })
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

          if projects_started[project_root] then
            return
          end
          projects_started[project_root] = true

          -- Quick async check if ruby-lsp is available for this project
          vim.system(
            { "mise", "-C", project_root, "which", "ruby-lsp" },
            { text = true },
            function(result)
              vim.schedule(function()
                if result.code == 0 then
                  start_ruby_lsp(project_root)
                else
                  start_solargraph(project_root)
                end
              end)
            end
          )
        end,
      })
    end,
  },
}
