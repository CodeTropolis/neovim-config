local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)

  use 'wbthomason/packer.nvim'

  use 'EdenEast/nightfox.nvim' 

  use 'akinsho/toggleterm.nvim'

  -- File explorer
  use 'nvim-tree/nvim-tree.lua'
  use 'nvim-tree/nvim-web-devicons'

  use 'nvim-lualine/lualine.nvim'

  --use 'nvim-treesitter/nvim-treesitter'

 use {
   'nvim-telescope/telescope.nvim',
   tag = '0.1.1',
   requires = {{ 'nvim-lua/plenary.nvim', 'BurntSushi/ripgrep' }}
 }

--  use {
--  -- Installs language servers.
--    'williamboman/mason.nvim',
--
--    -- Bridges gap between Mason and nvim-lsp.
--    'williamboman/mason-lspconfig.nvim',
--
--    -- Configures lsp servers.
--    'neovim/nvim-lspconfig',
--  }

  -- Allows further functionality to ts server such as renaming a file and updating imports.
--  use 'jose-elias-alvarez/typescript.nvim'

  -- Allows LSP servers to appear in auto completion.
  -- Breaks Neovim when attempting to go into insert mode.
  -- use 'hrsh7th/cmp-nvim-lsp'

  -- Add enhance UIs to LSP experience.
--use({
--    "glepnir/lspsaga.nvim",
--    branch = "main",
--    config = function()
--        require("lspsaga").setup({})
--    end,
--    requires = {
--        {"nvim-tree/nvim-web-devicons"},
--        --Please make sure you install markdown and markdown_inline parser
--        {"nvim-treesitter/nvim-treesitter"}
--    }
--})
  -- Add VSCode-like icons to auto completion window.
 -- use 'onsails/lspkind.nvim'



  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)
