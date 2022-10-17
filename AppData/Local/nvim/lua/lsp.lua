local nvim_lsp = require('lspconfig')

local lsputils = require('vim.lsp.util')
local api = vim.api

-- Setup lspconfig.
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

local on_attach = function(client, bufnr)
  if client.name == "tsserver" then
     client.server_capabilities.document_formatting = false
  end

  local opts = { noremap=true, silent=true }
  local keymap = vim.api.nvim_set_keymap
  -- lsp
  keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  keymap('n', 'gt', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  keymap('n', '<leader>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  keymap('n', '<leader>dl', '<cmd>Telescope diagnostics<CR>', opts)
  keymap('n', '<leader>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  keymap('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  keymap('n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
  keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
  keymap('n', '<leader>fo', '<cmd>lua vim.lsp.buf.formatting({ tabSize = 4, trimTrailingWhitespace = true, trimFinalNewLines = true })<CR>', opts)
  keymap('n', '<leader>ld', '<cmd>Telescope lsp_definitions<CR>', { noremap = true })
  keymap('n', '<leader>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)
  keymap('n', '<leader>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)

end

local servers = { 'tsserver','html'}
for _, lsp in ipairs(servers) do
  if lsp == 'omnisharp' then
    local pid = vim.fn.getpid()
    local omnisharp_bin = "~\\scoop\\apps\\omnisharp\\1.39.1\\Omnisharp.exe"
    nvim_lsp[lsp].setup {
      capabilities = capabilities,
       cmd = { omnisharp_bin, "--languageserver" , "--hostPID", tostring(pid) },
       on_attach = on_attach
     }
     elseif lsp == 'html' then
    nvim_lsp[lsp].setup {
      capabilities = capabilities,
       filetypes = { "html", "razor","blazor" ,"aspnetcorerazor"},
       on_attach = on_attach
     }
   else
    nvim_lsp[lsp].setup {
      capabilities = capabilities,
      on_attach = on_attach,
      flags = {
        debounce_text_changes = 150,
      }
  }
end
end


vim.cmd([[
augroup lsp
  autocmd!
  autocmd BufWritePre *.js lua vim.lsp.buf.formatting_sync(nil, 100)
  autocmd BufWritePre *.jsx lua vim.lsp.buf.formatting_sync(nil, 100)
  autocmd BufWritePre *.py lua vim.lsp.buf.formatting_sync(nil, 100)
  autocmd BufWritePre *.cs lua vim.lsp.buf.formatting_sync(nil, 100)
augroup end
]])
