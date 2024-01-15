-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.g.mapleader = " "

vim.keymap.set("n", "<leader>h", ":nohlsearch<CR>")

-- Upon Ctrl+V, move selection up and down.
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Move cursor to split on right.
vim.keymap.set("n", "<leader>m", "<C-w><right>")

-- Move cursor to split on left.
vim.keymap.set("n", "<leader>p", "<C-w><left>")

-- Move cursor to split above.
vim.keymap.set("n", "<leader>u", "<C-w><up>")

-- Move cursor to split below.
vim.keymap.set("n", "<leader>b", "<C-w><down>")

-- Set terminal to normal mode.
-- Do this prior to attempting to split terminal.
vim.keymap.set("t", "<leader>n", "<C-\\><C-n>")

---- Splt Terminal vertically.
--vim.keymap.set("t", "<leader>sv", ":vsplit | term<CR>")
--vim.keymap.set("n", "stv", ":vsplit<Return><C-w>w :terminal <CR>")
