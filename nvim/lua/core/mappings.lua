vim.keymap.set("n", "-", ":Oil<CR>")
vim.keymap.set("n", "<C-x>", ":BufferLineCloseOthers<CR>")
vim.keymap.set("n", "<Tab>", ":BufferLineCycleNext<CR>")
vim.keymap.set("n", "<s-Tab>", ":BufferLineCyclePrev<CR>")

vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(event)
		local bufmap = function(mode, lhs, rhs)
			local opts = { buffer = event.buf, noremap = true, silent = true }
			vim.keymap.set(mode, lhs, rhs, opts)
		end
		bufmap("n", "gd", ":lua vim.lsp.buf.definition()<CR>")
		bufmap("n", "gD", ":lua vim.lsp.buf.declaration()<CR>")
		bufmap("n", "gi", ":lua vim.lsp.buf.implementation()<CR>")
		bufmap("n", "gr", ":lua vim.lsp.buf.references()<CR>")
	end,
})

vim.keymap.set("n", "<Up>", "<nop>")
vim.keymap.set("n", "<Down>", "<nop>")
vim.keymap.set("n", "<Left>", "<nop>")
vim.keymap.set("n", "<Right>", "<nop>")

vim.keymap.set("i", "<Up>", "<nop>")
vim.keymap.set("i", "<Down>", "<nop>")
vim.keymap.set("i", "<Left>", "<nop>")
vim.keymap.set("i", "<Right>", "<nop>")
