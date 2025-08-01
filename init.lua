-- init.lua
require("core.options")
require("core.keymaps")

-- Bootstrap lazy.nvim if missing
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git", "clone", "--filter=blob:none",
    "https://github.com/folke/lazy.nvim", lazypath
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup("plugins")    -- load plugin specs

-- vim.api.nvim_create_autocmd("FileType", {
--   pattern = "java",
--   callback = function() require("lsp.java") end,
-- })


-- vim.api.nvim_create_autocmd("FileType", {
--   pattern = "py",
--   callback = function() require("lsp.python") end,
-- })
-- vim.lsp.enable('pyright')

-- vim.lsp.enable('jdtls')

vim.cmd.colorscheme("gruvbox")  -- set colorscheme

-- vim.lsp.enable('tsserver')

require("lsp")