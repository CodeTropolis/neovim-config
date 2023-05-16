local status, toggleterm = pcall(require, 'toggleterm')
if not status then
  print ('toggleterm status not ok!')
  return
end


toggleterm.setup({
  open_mapping = [[<C-`>]],
  size = 10,
  start_in_insert = false,
  shading_factor = 1,
})

-- Open Terminal upon launching Neovim.
vim.api.nvim_exec([[
  autocmd VimEnter * call timer_start(100, {-> execute('ToggleTerm')})
]], false)
