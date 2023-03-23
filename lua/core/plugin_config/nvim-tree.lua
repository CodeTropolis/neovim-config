vim.g.loaded_netrw = 1
vim.gloaded_netrwPlugin = 1

require('nvim-tree').setup({
  view = {
  side = "left",
  width = 35,
  },
})

-- Find current file and open dir in NvimTree
vim.keymap.set('n', '<c-n>', ':NvimTreeFindFileToggle<CR>')

-- Open NvimTree on enter
local function open_nvim_tree()
  -- open the tree
  require("nvim-tree.api").tree.open()
end
vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree })

-- Toggle *only* between a buffer and nvim-tree
local function toggle_nvim_tree_and_buffer()
    -- Get the list of all buffers
    local buffers = vim.tbl_filter(function(buf)
        return vim.api.nvim_buf_is_valid(buf)
            and vim.api.nvim_buf_is_loaded(buf)
            and vim.api.nvim_buf_get_option(buf, "buftype") == ""
            and vim.fn.bufname(buf) ~= ""
            and not vim.startswith(vim.fn.bufname(buf), "term://")
    end, vim.api.nvim_list_bufs())

    -- If NvimTree is open, close it and switch to the last buffer in the list
    if require('nvim-tree.view').open() then
      print('nvim-tree is open')
        --require('nvim-tree').close()
        vim.api.nvim_set_current_buf(buffers[#buffers])
        local currentBuffer = vim.api.nvim_buf_get_name(0)
        print(currentBuffer)
    else
        -- If NvimTree is not open and the current buffer is not a terminal, open NvimTree
        if not vim.startswith(vim.fn.bufname(vim.api.nvim_get_current_buf()), "term://") then
            --require('nvim-tree').toggle()
            require("nvim-tree.api").tree.open()
        end
    end
end

-- Set the keybinding to call the function
_G.toggle_nvim_tree_and_buffer = toggle_nvim_tree_and_buffer
local opts = { noremap=true, silent=true }
vim.keymap.set( "n", "<leader>t", ':lua toggle_nvim_tree_and_buffer()<CR>', opts)



