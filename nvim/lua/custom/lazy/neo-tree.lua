return {
  'nvim-neo-tree/neo-tree.nvim',
  branch = 'v3.x',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
    'MunifTanjim/nui.nvim',
    -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
  },
  config = function()
    require('neo-tree').setup {
      window = {
        width = 30,
        mappings = {
          ['o'] = 'open',
        },
      },
      filesystem = {
        filtered_items = {
          hide_dotfiles = false,
          hide_hidden = false,
        },
      },
      buffers = { follow_current_file = { enabled = true } },
    }
    vim.cmd [[nnoremap <Leader>p :Neotree toggle<cr>]]
    vim.keymap.set('n', '<Leader>r', ':Neotree filesystem reveal left<CR>', {})
  end,
}
