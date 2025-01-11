require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map({ "n", "i", "v" }, "<Up>", "<nop>")
map({ "n", "i", "v" }, "<Down>", "<nop>")
map({ "n", "i", "v" }, "<Left>", "<nop>")
map({ "n", "i", "v" }, "<Right>", "<nop>")

map("n", "-", ":Oil<CR>", { desc = "File tree" })
