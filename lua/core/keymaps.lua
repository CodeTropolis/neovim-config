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
vim.keymap.set('n', 'sv', ':vsplit<Return><C-w>w')

-- Set terminal to normal mode. Do this prior to attempting to split terminal.
vim.keymap.set('t', '<C-e>', '<C-\\><C-n>')
--
---- Splt Terminal horizontally 
vim.keymap.set('n', 'sth', ':split<Return><C-w>w :terminal <CR>')
--
---- Split Terminal vertically 
vim.keymap.set('n', 'stv', ':vsplit<Return><C-w>w :terminal <CR>')
--
---- End terminal session and close terminal.
vim.keymap.set('n', '<leader>kt', ':bd!<CR>')

---- Toggle to buffer
vim.keymap.set('n', 'tt', '<C-w>w')
