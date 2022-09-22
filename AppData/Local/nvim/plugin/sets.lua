local opt = vim.opt

local options = {
   backup = false,                                  -- creates a backup file
   clipboard = "unnamedplus",                       -- allow neovim to access the system clipboard
   cmdheight = 1,                                   -- more space in nvim command line for displaying messages
   conceallevel = 0,                                -- so that `` is  visible in markdown files
   fileencoding = "utf-8",                          -- the encoding of written file
   hidden = true,                                   -- required to keep multiple buffers and open multiple buffers
   hlsearch = true,                                 -- highlight all matches on previous search pattern
   ignorecase = true,                               -- ignore case in search pattern
   mouse = "a",                                     -- allow the mouse to be used in neovim
   showmode = false,                                -- no need to see -- INSERT-- anymore
   smartcase = true,                                -- smart case
   smartindent = true,                              -- Making identing smarter
   splitbelow= true,                                -- force all horizontal splits to go below current window
   splitright = true,                               -- force all vertical splits to go to the right of current window.
   swapfile = false,                                -- creates a swapfile; disables
   timeoutlen= 500,                                 -- time to wait for a mapped sequence to complete (in milliseconds)
   undofile=true,                                   -- enables persistent undo
   updatetime=300,                                  -- faster completion (4000 ms default)
   writebackup=false,                               -- if a file is being edited by another program
   expandtab = true,                                -- convert tabs to spaces
   shiftwidth = 2,                                  -- the number of space inserted for each indetntation
   tabstop = 2,                                     -- Insert 2 spaces for tab
   cursorline = true,                               -- highlight the current line
   signcolumn = "yes",                              -- always show the sign colum, otherwise it would shift text each time
   scrolloff = 8,
   colorcolumn = "80",
}

vim.opt.shortmess:append "c"

for k, v in pairs(options) do
  vim.opt[k] = v
end

vim.cmd([[
  function! MyFoldFunction()
      let line = getline(v:foldstart)
      “ cleanup unwanted things in first line
      let sub = substitute(line, '/\*\|\*/\|^\s+', '', 'g')
      “ calculate lines in folded text
      let lines = v:foldend - v:foldstart + 1
      return v:folddashes.sub.'...'.lines.' Lines...'.getline(v:foldend)
  endfunction
]])

vim.cmd([[
   set number
   set foldenable
   set foldtext=MyFoldFunction()
]])

