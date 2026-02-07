-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua

-- Delete default buffer navigation keymaps
vim.keymap.del("n", "<S-h>")
vim.keymap.del("n", "<S-l>")

-- Telescope buffers with Shift-H
vim.keymap.set(
  "n",
  "<S-h>",
  "<cmd>Telescope buffers sort_mru=true sort_lastused=true initial_mode=normal theme=ivy<cr>",
  { desc = "[P]Open telescope buffers" }
)

-- Exit insert mode with kk
vim.keymap.set("i", "kk", "<ESC>", { desc = "[P]Exit insert mode with kk" })

-- Alternate buffer with leader+space
vim.keymap.set("n", "<leader><space>", "<cmd>e #<cr>", { desc = "Alternate buffer" })
