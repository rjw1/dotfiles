-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Fix Cmd+C deleting text in Visual Mode by mapping it to yank
vim.keymap.set("v", "<D-c>", "y", { desc = "Copy to clipboard" })
vim.keymap.set("n", "<D-v>", '"+p', { desc = "Paste from clipboard" })
vim.keymap.set("v", "<D-v>", '"+p', { desc = "Paste from clipboard" })
vim.keymap.set("i", "<D-v>", "<C-r>+", { desc = "Paste from clipboard" })
