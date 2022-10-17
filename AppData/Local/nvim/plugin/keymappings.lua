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

-- locallist  list
keymap("n","<leader>ln",":lnext<CR>",opts)
keymap("n","<leader>lp",":lprev<CR>",opts)

-- Naviagate buffers
keymap("n", "<leader>bn", ":bnext<CR>", opts)
keymap("n", "<leader>bp", ":bprevious<CR>", opts)
-- Alternate file
keymap("n","<BS>","<C-^>",opts)

-- Toggle File Manaeger
keymap("n","<c-b>",":NvimTreeFindFileToggle<cr>", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
keymap("v", "U", ":m '<-2<CR>gv=gv", opts)
keymap("v", "E", ":m '>+1<CR>gv=gv", opts)
keymap("n", "<leader>cd", ":cd %:p:h<CR>", opts) 

keymap("n","<leader>gw",":lua require('telescope').extensions.git_worktree.git_worktrees()<CR>",opts)
keymap("n","<leader>gm",":lua require('telescope').extensions.git_worktree.create_git_worktree()<CR>",opts)
keymap("n","<leader>sb",":lua require('telescope.builtin').buffers()<CR>",opts)
keymap("n","<leader>lg",":lua require('telescope.builtin').live_grep()<CR>",opts)
keymap("n","<C-p>",":lua require('telescope.builtin').find_files()<CR>",opts)
keymap("n","<leader>sr",":lua require('telescope.builtin').lsp_references()<CR>",opts)
keymap("n","<leader>ss",":lua require('telescope.builtin').lsp_document_symbols()<CR>",opts)
keymap("n","<leader>ca",":lua require('telescope.builtin').lsp_code_actions()<CR>",opts)
keymap("n","<leader>sd",":lua require('telescope.builtin').lsp_definitions()<CR>",opts)
keymap("n","<leader>lD",":lua require('telescope.builtin').lsp_type_definitions()<CR>",opts)
keymap("n","<leader>co",":Telescope find_files cwd=~/AppData/Local/nvim <CR>",opts)
keymap("n","<leader>fd",":lua vim.lsp.buf.formatting_sync() <CR>",opts)

-- Git Signs
keymap("n","<leader>sh", ":Gitsigns stage_hunk<CR>",opts)
keymap("v","<leader>sh",":Gitsigns stage_hunk<CR>",opts)

keymap("n","<leader>rh",":Gitsigns reset_hunk<CR>",opts)
keymap("v","<leader>hr",":Gitsigns reset_hunk<CR>",opts)
keymap("n","<leader>sb",":Gitsigns stage_buffer<CR>",opts)
keymap("n","<leader>uh",":Gitsigns undo_stage_hunk<CR>",opts)
keymap("n","<leader>ub",":Gitsigns reset_buffer<CR>",opts)
keymap("n","<leader>ph",":Gitsigns preview_hunk<CR>",opts)
keymap("n","<leader>tb",":Gitsigns toggle_current_line_blame<CR>",opts)
keymap("n","<leader>td",":Gitsigns diffthis<CR>",opts)

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

