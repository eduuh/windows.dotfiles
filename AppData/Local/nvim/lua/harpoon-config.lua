 local harpoon = require('harpoon')

harpoon.setup({
global_settings = {
        save_on_toggle = false,
        save_on_change = true,
        enter_on_sendcmd = true,
        excluded_filetypes = {"harpoon"}
    },
  })

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

