vim.g.mapleader = ' '
vim.g.maplocalleacer = ' '
vim.keymap.set('n', '<leader>h', ':nohlsearch<CR>')

-- Upon Ctrl+V, move selection up and down.
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- New tab
vim.keymap.set('n', 'nt', ':tabedit <CR>')
-- Close current tab
vim.keymap.set('n', 'ct', ':tabc <CR>')
-- Move to next tab: gt
-- Move to prev. tab gT

-- Split window
--vim.keymap.set('n', 'ss', ':split<Return><C-w>w')
vim.keymap.set('n', 'sv', ':vsplit<Return><C-w>w')

-- Splt Terminal horizontally 
vim.keymap.set('n', 'sth', ':split<Return><C-w>w :terminal <CR>')
-- Split Terminal vertically 
vim.keymap.set('n', 'stv', ':vsplit<Return><C-w>w :terminal <CR>')
