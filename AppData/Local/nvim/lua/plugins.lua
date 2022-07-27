local fn = vim.fn

local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

vim.cmd [[packadd packer.nvim]]

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
augroup packer_user_config
  autocmd!
  autocmd BufWritePost plugins.lua source <afile> | PackerSync
augroup end
]])

return require('packer').startup(function()
-- Packer can manage itself
use 'lewis6991/impatient.nvim'
use 'wbthomason/packer.nvim'
use 'neovim/nvim-lspconfig'
use 'terrortylor/nvim-comment'
use 'Pocco81/AutoSave.nvim'
use 'nvim-telescope/telescope.nvim'
use 'ThePrimeagen/git-worktree.nvim'
use 'EdenEast/nightfox.nvim'
use 'nvim-lua/plenary.nvim'
use 'nvim-lua/popup.nvim'
use 'ThePrimeagen/harpoon'
use 'rstacruz/vim-closer'
use 'norcalli/nvim-colorizer.lua'
use 'tpope/vim-obsession'
use 'tpope/vim-surround'
use 'tpope/vim-dispatch'
use 'tpope/vim-repeat'
use 'tpope/vim-sensible'
use 'Shougo/vimproc.vim'

use 'dense-analysis/ale'
 use {
      'nvim-treesitter/nvim-treesitter',
      run = ':TSUpdate'
  }
use {
'nvim-lualine/lualine.nvim',
requires = {'kyazdani42/nvim-web-devicons', opt = true}
}
use {"ellisonleao/gruvbox.nvim", requires = {"rktjmp/lush.nvim"}}
use {
'Shougo/defx.nvim',
run = ':UpdateRemotePlugins'
}
use 'kristijanhusak/defx-git'
use 'jose-elias-alvarez/null-ls.nvim'
use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make'}
use { 'TimUntersberger/neogit', requires = 'nvim-lua/plenary.nvim'}

-- completion , snippets and Sources
use 'hrsh7th/cmp-buffer'
use 'hrsh7th/cmp-path'
use 'hrsh7th/cmp-cmdline'
use 'hrsh7th/vim-vsnip'
use 'hrsh7th/vim-vsnip-integ'
use 'hrsh7th/cmp-nvim-lsp'
use 'hrsh7th/cmp-nvim-lsp-document-symbol'
use 'hrsh7th/cmp-omni'
use 'hrsh7th/nvim-cmp'

end)