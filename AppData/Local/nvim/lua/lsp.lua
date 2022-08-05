local nvim_lsp = require('lspconfig')

local lsputils = require('vim.lsp.util')
local api = vim.api

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

local on_attach = function(client, bufnr)
  if client.name == "tsserver" then
     client.resolved_capabilities.document_formatting = false
  end

  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end

  local opts = { noremap=true, silent=true }
end

-- yamlls - for kubernetes and docker-compose I could override the schemas
--'omnisharp'
--install lua server : https://github.com/sumneko/lua-language-server/wiki/Build-and-Run
-- lua stuff

local servers = { 'tsserver','html' }
for _, lsp in ipairs(servers) do
  if lsp == 'omnisharp' then
    local pid = vim.fn.getpid()
    local omnisharp_bin = "/home/edd/.vscode-insiders/extensions/ms-dotnettools.csharp-1.23.17/.omnisharp/1.37.17/run"
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
