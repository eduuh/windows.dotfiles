vim.cmd([[
   set termguicolors 
]])

require('impatient')

require('plugins')
require('lsp')
require('defx')
require("harpoon-config")

local null_ls = require("null-ls")
local formatting = require("null-ls").builtins.formatting 
local diagnostics = require("null-ls").builtins.diagnostics

null_ls.setup {
  debug = false,
  sources = {
    formatting.prettier.with {
      extra_filetypes = { "tsx", "ts" },
      extra_args = {"--jsx-single-quote", "--tab-width 4" },
    },
    formatting.stylua,
    diagnostics.eslint,
  }
}

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
require('telescope-config')
