return {
  'vincent178/nvim-github-linker',
  config = function()
    require('nvim-github-linker').setup {
      mappings = true,
      default_remote = 'origin',
      copy_to_clipboard = true,
    }
    vim.keymap.set('v', '<leader>cg', ':GithubLink<CR>', {})
  end,
}
