require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = { 'lua_ls', 'tsserver', 'html', 'cssls'}
})

local on_attach = function(_, _)
  vim.o.updatetime = 250
  vim.cmd [[autocmd! CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false})]]

  vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, {})
  vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, {})

  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, {})
  vim.keymap.set('n', 'gr', require('telescope.builtin').lsp_refrences, {})
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
end


require('lspconfig').lua_ls.setup {
   settings = {
        Lua = {
            diagnostics = {
                globals = { 'vim' } -- Remove Undefined global warnings for vim.o, vim.keymap, etc.
            }
        }
    }
}
require('lspconfig').tsserver.setup{
  on_attach = on_attach,
  filetypes = { "typescript", "typescriptreact", "typescript.tsx" },
  cmd = { "typescript-language-server", "--stdio" }
}
require('lspconfig').html.setup {}
require('lspconfig').cssls.setup{}
