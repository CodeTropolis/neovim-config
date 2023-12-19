vim.g.loaded_netrw = 1
vim.gloaded_netrwPlugin = 1

require('nvim-tree').setup({
  view = {
   side = "left",
  width = 30,
  },
})

-- Find current file and open dir in NvimTree
vim.keymap.set('n', '<c-n>', ':NvimTreeFindFileToggle<CR>')

-- Open NvimTree on NeoVim launch
local function open_nvim_tree()
  require("nvim-tree.api").tree.open()
end
vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree })


