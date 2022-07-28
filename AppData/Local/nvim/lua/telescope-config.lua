local telescope = require('telescope')

local opts = { noremap = true, silent = true }
local term_opt = { silent = true }

telescope.setup{
pickers = {
   find_files = {
      hidden = true,
   }
},
defaults = {
     prompt_prefix = ">> ",
  file_ignore_patterns = {"obj", "vptests", "bin", "node_modules", "plugged", "autoload", "images"},
  mappings= {
     i = {
      ["<c-q>"] = require("telescope.actions").send_to_qflist + require("telescope.actions").open_qflist,
      ["<c-s"] = require("telescope.actions").send_selected_to_qflist + require("telescope.actions").open_qflist,
      }
   },
     extensions = {
         fzf = {
            fuzzy = true,
            override_file_sorter = true,
      case_mode = "smart_case",
           }
       }
  }
}


telescope.load_extension("git_worktree")
