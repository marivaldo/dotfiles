return {
  {
    "mason-org/mason-lspconfig.nvim",
    opts = {
      -- Don't auto-install solargraph via Mason (use system version)
      automatic_installation = {
        exclude = { "solargraph" },
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        ruby_lsp = {
          cmd = { vim.fn.expand("~/.local/bin/ruby-lsp-wrapper") },
        },
        solargraph = {
          -- Use system solargraph (installed via Homebrew)
          mason = false,
          cmd = { "solargraph", "stdio" },
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
        },
      },
    },
  },
}
