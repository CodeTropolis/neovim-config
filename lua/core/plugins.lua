local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
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

  use 'nvim-treesitter/nvim-treesitter'

  use {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.1',
    requires = { { 'nvim-lua/plenary.nvim', 'BurntSushi/ripgrep' } }
  }

  use {
    --  -- Installs language servers.
    'williamboman/mason.nvim',
    --
    --    -- Bridges gap between Mason and nvim-lsp.
    'williamboman/mason-lspconfig.nvim',
    --
    --    -- Configures lsp servers.
    'neovim/nvim-lspconfig',
  }

  -- Allows further functionality to ts server such as renaming a file and updating imports.
  use 'jose-elias-alvarez/typescript.nvim'

  -- Allows LSP servers to appear in auto completion.
  -- hrsh7th/cmp-nvim-lsp broke Neovim when attempting to go into insert mode.
  -- This plugin broke Neovim when attempting to use alone.
  -- Once the other hrsh7th plugins are used, the issue goes away.
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/nvim-cmp'

  -- Add enhance UIs to LSP experience.
  use({
    "glepnir/lspsaga.nvim",
    branch = "main",
    config = function()
      require("lspsaga").setup({})
    end,
    requires = {
      { "nvim-tree/nvim-web-devicons" },
      --Please make sure you install markdown and markdown_inline parser
      { "nvim-treesitter/nvim-treesitter" }
    }
  })
  
  -- Add VSCode-like icons to auto completion window.
  use 'onsails/lspkind.nvim'

  use("saadparwaiz1/cmp_luasnip") --> Snippets source for nvim-cmp
  use("L3MON4D3/LuaSnip")         --> Snippets plugin

  use 'lewis6991/gitsigns.nvim'

  use {
    "windwp/nvim-autopairs",
    config = function() require("nvim-autopairs").setup {} end
  }

use {
  "folke/which-key.nvim",
  config = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 300
    require("which-key").setup {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    }
  end
}


  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)
