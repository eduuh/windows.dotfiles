vim.cmd([[
   set termguicolors 
]])

require('plugins')

require('impatient')

require('nvim-fileexplorer')
require("harpoon-config")

local formatting = require("null-ls").builtins.formatting 
local diagnostics = require("null-ls").builtins.diagnostics

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
          theme = 'material'
   }
}

local neogit = require('neogit')
neogit.setup()

require('nvim_comment').setup()

--set theme
vim.o.background = "dark"

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

require('completion')
require('lsp')
require('telescope-config')
require('gitsigns')

vim.o.background = 'dark'

vim.cmd([[
    let g:ale_linters = {}
    let g:ale_linters.typescript = ['eslint', 'tsserver']
    let g:ale_typescript_prettier_use_local_config = 0
    let g:ale_linters_explicit =  1
]])

-- org mode

-- Load custom tree-sitter grammar for org filetype


-- Tree-sitter configuration
require'nvim-treesitter.configs'.setup {
  -- If TS highlights are not enabled at all, or disabled via `disable` prop, highlighting will fallback to default Vim syntax highlighting
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = {'org'}, -- Required for spellcheck, some LaTex highlights and code block highlights that do not have ts grammar
  },
  ensure_installed = {'org', 'typescript', 'javascript'}, -- Or run :TSUpdate org
}

require('orgmode').setup({
  org_agenda_files = {"~\\OneDrive - Microsoft\\Notes\\Org\\*"},
  org_default_notes_file ="~\\OneDrive - Microsoft\\Notes\\Org\\refile.org",
})

require('orgmode').setup_ts_grammar()
--require('org-bullets').setup()
--require('headlines').setup()

-- remove blank line indicators ~~
vim.wo.fillchars='eob: '
--Lua:

vim.g.material_style = "darker"
vim.cmd 'colorscheme material'

