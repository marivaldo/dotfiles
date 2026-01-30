return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        ruby_lsp = {
          cmd = { vim.fn.expand("~/.local/bin/ruby-lsp-wrapper") },
        },
      },
    },
  },
}
