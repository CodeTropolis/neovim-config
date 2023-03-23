vim.g.loaded_netrw = 1
vim.gloaded_netrwPlugin = 1

require('nvim-tree').setup()

-- Find current file and open dir in NvimTree
vim.keymap.set('n', '<c-n>', ':NvimTreeFindFileToggle<CR>')

