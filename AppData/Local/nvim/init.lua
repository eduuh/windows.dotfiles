vim.cmd([[
   set termguicolors 
]])
require('impatient')

require('plugins')
require('lsp')
require('telescope-config')
require('defx')
require("harpoon-config")

require('autosave').setup(
  {
      events = {"TextChanged", "BufLeave"},
  }
)

require 'colorizer'.setup {
  'css';
  'javascript';
  'xdefaults';
  html = {
    mode = 'foreground';
  }
}

require('lualine').setup{
   options = {
          theme = 'gruvbox'
   }
}

local neogit = require('neogit')
neogit.setup()

require('nvim_comment').setup()

--set theme
vim.o.background = "dark"

vim.cmd([[
   colorscheme gruvbox
]])

--remove whitespaces ff
vim.cmd([[
augroup whitespaces
   autocmd!
  "autocmd BufWritePre * %s/\s\+$//e
  "autocmd BufWritePre * %s/\n\+\%$//e
  "autocmd BufWritePre *.[ch] %s/\%$/\r/e
augroup end
]])

vim.cmd([[
  :au FocusLost * silent! wa
]])

-- tree sitter
require'nvim-treesitter.configs'.setup {
  ensure_installed = { "typescript", "javascript" },
    highlight ={
    enable = true,
    additional_vim_regex_highlighting = false,
  },
}

require('cmp-config')
