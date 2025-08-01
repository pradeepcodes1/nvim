-- lua/plugins/lsp/init.lua (example main loader)
local on_attach   = require("lsp.common").on_attach
local capabilities = require("cmp_nvim_lsp").default_capabilities()

-- Ensure Mason is installed and configured
-- require("mason").setup()
--   require("mason-lspconfig").setup({
--     ensure_installed = { "lua_ls", "tsserver", "typescript-language-server", "pyright" },
--     automatic_installation = true,
--   })
vim.diagnostic.config({
  virtual_text = true,   -- ← must be true (or table) for inline error text
})

vim.api.nvim_create_autocmd("CursorHold", {
  callback = function() vim.diagnostic.open_float(nil, {focus=false}) end
})
-- Make CursorHold fire faster if you like:
vim.o.updatetime = 500


require("lsp.python").setup(on_attach, capabilities)
-- require("lsp.js").setup(on_attach, capabilities)
