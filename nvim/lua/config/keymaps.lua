-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Allow :Q, :W, :Wq, :WQ to work like lowercase versions
vim.cmd("command! Q q")
vim.cmd("command! W w")
vim.cmd("command! Wq wq")
vim.cmd("command! WQ wq")
vim.cmd("command! Qa qa")
vim.cmd("command! QA qa")

-- Reveal current file in explorer
vim.keymap.set("n", "<leader>r", function()
  -- Find explorer window
  for _, win in ipairs(vim.api.nvim_list_wins()) do
    local buf = vim.api.nvim_win_get_buf(win)
    local ft = vim.bo[buf].filetype
    if ft == "snacks_picker_list" or ft:match("^snacks") then
      vim.api.nvim_set_current_win(win)
      return
    end
  end
  -- Not open, open it
  Snacks.explorer()
end, { desc = "Reveal file in explorer" })
