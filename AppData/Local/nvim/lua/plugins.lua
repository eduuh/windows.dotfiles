local fn = vim.fn

local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

-- C:/Users/edwinmuraya/AppData/Local/nvim-data/site/pack/packer/start/vimproc.vim/lib/vimproc_win64.dll

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
use 'terrortylor/nvim-comment'
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
use 'lewis6991/gitsigns.nvim'
use 'dense-analysis/ale'
use 'Mofiqul/vscode.nvim'

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
use 'neovim/nvim-lspconfig'
use 'hrsh7th/cmp-nvim-lsp'
use 'hrsh7th/cmp-buffer'
use 'hrsh7th/cmp-path'
use 'hrsh7th/cmp-cmdline'
use 'hrsh7th/nvim-cmp'

use 'hrsh7th/cmp-vsnip'
use  'hrsh7th/vim-vsnip'
-- File explorer
use {
  'kyazdani42/nvim-tree.lua',
  requires = {
    'kyazdani42/nvim-web-devicons', -- optional, for file icons
  },
  tag = 'nightly' -- optional, updated every week. (see issue #1193)
}

use "numToStr/Comment.nvim"
use "folke/todo-comments.nvim"
use "weirongxu/plantuml-previewer.vim"
use "aklt/plantuml-syntax"
use {"Shougo/vimproc.vim", run = 'make'}
use "tyru/open-browser.vim"

use {'nvim-orgmode/orgmode', config = function()
        require('orgmode').setup{}
end
}

use {'akinsho/org-bullets.nvim', config = function()
  require('org-bullets').setup()
end}

use {
    'lukas-reineke/headlines.nvim',
    config = function()
        require('headlines').setup()
    end,
}

end)
