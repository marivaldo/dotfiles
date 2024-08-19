return { -- Fuzzy Finder (files, lsp, etc)
  'nvim-telescope/telescope.nvim',
  event = 'VimEnter',
  branch = '0.1.x',
  dependencies = {
    'nvim-lua/plenary.nvim',
    { -- If encountering errors, see telescope-fzf-native README for install instructions
      'nvim-telescope/telescope-fzf-native.nvim',

      -- `build` is used to run some command when the plugin is installed/updated.
      -- This is only run then, not every time Neovim starts up.
      build = 'make',

      -- `cond` is a condition used to determine whether this plugin should be
      -- installed and loaded.
      cond = function()
        return vim.fn.executable 'make' == 1
      end,
    },

    -- Useful for getting pretty icons, but requires a Nerd Font.
    { 'nvim-tree/nvim-web-devicons', enabled = vim.g.have_nerd_font },
  },
  config = function()
    require('telescope').setup {
      defaults = {
        theme = 'ivy',
        layout_strategy = 'bottom_pane',
        layout_config = {
          prompt_position = 'bottom',
          height = 0.4,
        },
      },
      pickers = {
        find_files = {
          hidden = true,
        },
      },
    }

    -- Enable telescope extensions, if they are installed
    pcall(require('telescope').load_extension, 'fzf')

    -- See `:help telescope.builtin`
    local builtin = require 'telescope.builtin'
    vim.keymap.set('n', '<leader>sh', builtin.help_tags)
    vim.keymap.set('n', '<leader>sk', builtin.keymaps)
    vim.keymap.set('n', '<C-p>', builtin.find_files)
    vim.keymap.set('n', '<leader>ss', builtin.builtin)
    vim.keymap.set('n', '<leader>sw', builtin.grep_string)
    vim.keymap.set('n', '<leader>sg', builtin.live_grep)
    vim.keymap.set('n', '<leader>sd', builtin.diagnostics)
    vim.keymap.set('n', '<leader>sr', builtin.resume)
    vim.keymap.set('n', '<leader>s.', builtin.oldfiles)
    vim.keymap.set('n', '<leader>b', function()
      require('telescope.builtin').buffers { sort_lastused = true, ignore_current_buffer = true }
    end)
    vim.keymap.set('n', '<leader>/', builtin.current_buffer_fuzzy_find)
    vim.keymap.set('n', '<leader>s/', function()
      builtin.live_grep {
        grep_open_files = true,
        prompt_title = 'Live Grep in Open Files',
      }
    end, { desc = '[S]earch [/] in Open Files' })
    vim.keymap.set('n', '<leader>sn', function()
      builtin.find_files { cwd = vim.fn.stdpath 'config' }
    end)
  end,
}
