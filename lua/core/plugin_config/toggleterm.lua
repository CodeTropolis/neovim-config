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




