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
keymap("n","<leader>wd",":lua require('telescope').extensions.git_worktree.create_git_worktree()<CR>",opts)
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

-- Git Signs
keymap("n","<leader>hs",":Gitsigns stage_hunk<CR>",opts)
keymap("v","<leader>hs",":Gitsigns stage_hunk<CR>",opts)

keymap("n","<leader>hr",":Gitsigns reset_hunk<CR>",opts)
keymap("v","<leader>hr",":Gitsigns reset_hunk<CR>",opts)
keymap("n","<leader>hS",":Gitsigns stage_buffer<CR>",opts)
keymap("n","<leader>hu",":Gitsigns undo_stage_hunk<CR>",opts)
keymap("n","<leader>hR",":Gitsigns reset_buffer<CR>",opts)
keymap("n","<leader>hp",":Gitsigns preview_hunk<CR>",opts)
keymap("n","<leader>tb",":Gitsigns toggle_current_line_blame<CR>",opts)
keymap("n","<leader>td",":Gitsigns diffthis<CR>",opts)

-- lsp
keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
keymap('n', '<leader>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
keymap('n', '<leader>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
keymap('n', '<leader>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
keymap('n', '<leader>d', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
keymap('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
keymap('n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
keymap('n', '<leader>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
keymap('n', '<leader>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
keymap('n', '<leader>fo', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
keymap('n', '<leader>ld', '<cmd>Telescope lsp_definitions<CR>', { noremap = true })

-- harpoon
vim.cmd([[
nnoremap <leader>m :lua require("harpoon.mark").add_file()<cr>
nnoremap <leader>af :lua require('harpoon.ui').toggle_quick_menu()<CR>
nnoremap <leader>an :lua require("harpoon.ui").nav_next()<CR>
nnoremap <leader>ap :lua require("harpoon.ui").nav_prev()<CR>

nnoremap <leader>aa :lua require("harpoon.ui").nav_file(1)<CR>
nnoremap <leader>ab :lua require("harpoon.ui").nav_file(2)<CR>
nnoremap <leader>ac :lua require("harpoon.ui").nav_file(3)<CR>
nnoremap <leader>ad :lua require("harpoon.ui").nav_file(4)<CR>
]])

-- Lsp
keymap("n", "<m-q>", ":call QuickFixToggle()<cr>", opts)
keymap("n", "<c-l>", "<cmd>lua vim.lsp.codelens.run()<cr>", opts)
