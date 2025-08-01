-- core/keymaps.lua
local map = vim.keymap.set
vim.g.mapleader = " "
map("n", "<leader>e", ":NvimTreeToggle<CR>", { desc = "Explorer" })
map("n", "<leader>ff", ":Telescope find_files<CR>", { desc = "Find Files" })
map("n", "<leader>fg", ":Telescope live_grep<CR>", { desc = "Grep" })
map("n", "<leader>rn", vim.lsp.buf.rename, { desc = "LSP Rename" })
map("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code Action" })

vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Goto Definition" })

