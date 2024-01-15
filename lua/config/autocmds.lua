-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

-- Open Terminal upon launching Neovim.
vim.api.nvim_exec(
  [[
  autocmd VimEnter * call timer_start(50, {-> execute('ToggleTerm')})
]],
  false
)

vim.api.nvim_exec(
  [[
  autocmd VimEnter * call timer_start(100, {-> execute(':vsplit | term')})
]],
  false
)
