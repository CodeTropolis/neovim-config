require 'nvim-treesitter.configs'.setup {


  -- Per https://github.com/nvim-treesitter/nvim-treesitter/issues/3092 
  -- Fix treesitter highlight error. Error executing lua:
  --  Since 0.8.0, Neovim bundles parsers and queries for c, lua, vim, and help.
  --  If you use nvim-treesitter, you must make sure these parsers are 
  --  installed via nvim-treesitter so that both parser and queries (which are always installed) are taken from nvim-treesitter.
  ensure_installed = {'typescript', 'css', 'scss', 'html', 'javascript', 'c', 'lua', 'vim', 'help'},

  sync_install = false,
  auto_install = true,
  highlight = {
    enable = true,
  },
}
