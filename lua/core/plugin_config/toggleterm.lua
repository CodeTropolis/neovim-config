local status, toggleterm = pcall(require, 'toggleterm')
if not status then
  print ('toggleterm status not ok!')
  return
end


toggleterm.setup({
  open_mapping = [[<c-`>]],
  size = 10,
  start_in_insert = true,
})

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
    if require('nvim-tree.view').win_open() then
        require('nvim-tree').close()
        vim.api.nvim_set_current_buf(buffers[#buffers])
    else
        -- If NvimTree is not open and the current buffer is not a terminal, open NvimTree
        if not vim.startswith(vim.fn.bufname(vim.api.nvim_get_current_buf()), "term://") then
            require('nvim-tree').toggle()
        end
    end
end

-- Set the keybinding to call the function
--vim.keymap.set('n', '<leader>t', ':lua toggle_nvim_tree_and_buffer()<CR>', {noremap = true })
local opts = { noremap=true, silent=true }
--vim.keymap.set( "n", "<leader>t", ':lua toggle_nvim_tree_and_buffer()<CR>', opts)
