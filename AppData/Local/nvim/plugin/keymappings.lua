local opts = { noremap = true, silent = true }
local cmd_opts = { expr = true, noremap = true }
-- shorten function name
local keymap = vim.api.nvim_set_keymap

--Modes
-- normal_mode = "n"
-- Insert_mode = "i"
-- visual_mode = "v"
-- visual_block_mode = "x"
-- term_mode = "t"
-- command_mode = "c"

vim.g.mapleader = ' '
vim.g.termguicolors = true
keymap("n","<Leader>h",  ":set hlsearch!<CR>",  opts )

-- Terminal --
keymap("t","<Esc>","<C-><C-n>",opts)

-- quickfix list
keymap("n","<leader>n",":cnext<CR>",opts)
keymap("n","<leader>p",":cprev<CR>",opts)

-- Naviagate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)
-- Alternate file
keymap("n","<BS>","<C-^>",opts)

-- Toggle File Manaeger
keymap("n","<c-t>",":Defx<cr>",opts)
keymap("i","<c-t>",":Defx<cr>",opts)
keymap("v","<c-t>",":Defx<cr>",opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
keymap("v", "U", ":m '<-2<CR>gv=gv", opts)
keymap("v", "E", ":m '>+1<CR>gv=gv", opts)
keymap("n", "<leader>cd", ":cd %:p:h<CR>", opts) 


-- Command --
-- Menu navigation
keymap("c", "<C-n>",  'pumvisible() ? "\\<C-n>" : "\\<C-j>"', cmd_opts )
keymap("c", "<C-p>",  'pumvisible() ? "\\<C-p>" : "\\<C-k>"', cmd_opts )
keymap("c", "w!!",  'execute "silent! write !sudo tee % >/dev/null" <bar> edit!', cmd_opts)

vim.cmd([[
  autocmd FileType cs nmap <silent> <buffer> <Leader>b :!dotnet build
  autocmd FileType cpp nmap  <buffer> <Leader>b :!g++ -g -Wall % -o program <cr>
  autocmd FileType cs setlocal omnifunc=OmniSharp#Complete
]])

-- TODO force omnisharp to reload server when switching branches
-- noremap <leader>rl :OmniSharpReloadSolution<cr>
-- nnoremap <leader>cf :OmniSharpCodeFormat<cr>
--Telescope

keymap("n","<leader>gw",":lua require('telescope').extensions.git_worktree.git_worktrees()<CR>",opts)
keymap("n","<leader>gm",":lua require('telescope').extensions.git_worktree.create_git_worktree()<CR>",opts)
keymap("n","<leader>fb",":lua require('telescope.builtin').buffers()<CR>",opts)
keymap("n","<leader>ff",":lua require('telescope.builtin').git_files()<CR>",opts)
keymap("n","<leader>fg",":lua require('telescope.builtin').live_grep()<CR>",opts)
keymap("n","<C-p>",":lua require('telescope.builtin').find_files()<CR>",opts)
keymap("n","<leader>lr",":lua require('telescope.builtin').lsp_references()<CR>",opts)
keymap("n","<leader>ls",":lua require('telescope.builtin').lsp_document_symbols()<CR>",opts)
keymap("n","<leader>la",":lua require('telescope.builtin').lsp_code_actions()<CR>",opts)
keymap("n","<leader>la",":lua require('telescope.builtin').lsp_code_actions()<CR>",opts)
keymap("n","<leader>ld",":lua require('telescope.builtin').lsp_definitions()<CR>",opts)
keymap("n","<leader>lD",":lua require('telescope.builtin').lsp_type_definitions()<CR>",opts)
keymap("n","<leader>co",":Telescope find_files cwd=~/.config/nvim <CR>",opts)
keymap("n","<leader>lc",":Telescope find_files cwd=~/.local/bin <CR>",opts)
keymap("n","<leader>fd",":lua vim.lsp.buf.formatting_sync() <CR>",opts)

