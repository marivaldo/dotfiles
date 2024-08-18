function ColorMyPencils(color)
  vim.opt.termguicolors = true
  vim.cmd 'syntax on'

  vim.g.oceanic_next_terminal_bold = 1
  vim.g.oceanic_next_terminal_italic = 1

  color = color or 'OceanicNext'
  vim.cmd.colorscheme(color)

  vim.api.nvim_set_hl(0, 'Normal', { bg = 'none' })
  vim.api.nvim_set_hl(0, 'NormalFloat', { bg = 'none' })
end

return {
  {
    'folke/tokyonight.nvim',
    config = function()
      require('tokyonight').setup {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        style = 'storm', -- The theme comes in three styles, `storm`, `moon`, a darker variant `night` and `day`
        transparent = true, -- Enable this to disable setting the background color
        terminal_colors = true, -- Configure the colors used when opening a `:terminal` in Neovim
        styles = {
          -- Style to be applied to different syntax groups
          -- Value is any valid attr-list value for `:help nvim_set_hl`
          comments = { italic = false },
          keywords = { italic = false },
          -- Background styles. Can be "dark", "transparent" or "normal"
          sidebars = 'dark', -- style for sidebars, see below
          floats = 'dark', -- style for floating windows
        },
      }
    end,
  },

  {
    'mhartington/oceanic-next',
    priority = 1000, -- make sure to load this before all the other start plugins
    init = function()
      vim.cmd 'colorscheme OceanicNext'

      ColorMyPencils()

      -- vim.cmd.hi 'Normal gui=none cterm=none'
      -- vim.cmd.hi 'LineNr gui=none cterm=none'
      -- vim.cmd.hi 'SignColumn gui=none cterm=none'
      -- vim.cmd.hi 'EndOfBuffer gui=none cterm=none'
    end,
  },
}
