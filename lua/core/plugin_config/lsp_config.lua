require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = { 'lua_ls', 'tsserver', 'html', 'cssls' }
})

local on_attach = function(client, bufnr)
  local bufopts = { noremap = true, silent = true, buffer = bufnr }

  vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, bufopts)
  vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, bufopts)
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
  vim.keymap.set('n', 'lr', vim.lsp.buf.rename, bufopts)
  vim.keymap.set('n', '<space>lf', function() vim.lsp.buf.format { async = true } end, bufopts)
end

require('lspconfig').lua_ls.setup {
  on_attach = on_attach,
  settings = {
    Lua = {
      diagnostics = {
        globals = { 'vim' } -- Remove Undefined global warnings for vim.o, vim.keymap, etc.
      }
    }
  }
}
require('lspconfig').tsserver.setup {
  on_attach = on_attach,
  filetypes = { "typescript", "typescriptreact", "typescript.tsx" },
  cmd = { "typescript-language-server", "--stdio" }
}
require('lspconfig').html.setup {}
require('lspconfig').cssls.setup {}
