local fn = vim.fn

local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

-- C:/Users/edwinmuraya/AppData/Local/nvim-data/site/pack/packer/start/vimproc.vim/lib/vimproc_win64.dll

vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()
-- Packer can manage itself
use 'lewis6991/impatient.nvim'
use 'wbthomason/packer.nvim'
use 'terrortylor/nvim-comment'
use 'nvim-telescope/telescope.nvim'
use 'ThePrimeagen/git-worktree.nvim'
use 'nvim-lua/plenary.nvim'
use 'nvim-lua/popup.nvim'
use 'ThePrimeagen/harpoon'
use 'norcalli/nvim-colorizer.lua'
use 'tpope/vim-surround'
use 'tpope/vim-dispatch'
use 'tpope/vim-repeat'
use 'dense-analysis/ale'
use 'marko-cerovac/material.nvim'
use 'jose-elias-alvarez/null-ls.nvim'
use 'nvim-treesitter/nvim-treesitter'
use 'lewis6991/gitsigns.nvim'
use 'Shougo/vimproc.vim' 

-- completion , snippets and Sources
use 'neovim/nvim-lspconfig'
use 'hrsh7th/cmp-nvim-lsp'
use 'hrsh7th/cmp-buffer'
use 'hrsh7th/cmp-path'
use 'hrsh7th/cmp-cmdline'
use 'hrsh7th/nvim-cmp'
use 'hrsh7th/cmp-vsnip'
use 'hrsh7th/vim-vsnip'
use 'nvim-orgmode/orgmode'
use 'akinsho/org-bullets.nvim'
use 'lukas-reineke/headlines.nvim'

use "numToStr/Comment.nvim"
use "folke/todo-comments.nvim"
use "weirongxu/plantuml-previewer.vim"
use "aklt/plantuml-syntax"
use "tyru/open-browser.vim"
use "OmniSharp/omnisharp-vim"
use "nickspoons/vim-sharpenup"
use "github/copilot.vim"

use { 'nvim-lualine/lualine.nvim', requires = {'kyazdani42/nvim-web-devicons', opt = true }}
use { 'TimUntersberger/neogit', requires = 'nvim-lua/plenary.nvim'}
use { 'kyazdani42/nvim-tree.lua',requires = {'kyazdani42/nvim-web-devicons' }}

end)
