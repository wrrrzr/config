local map = vim.keymap.set

map("n", "-", ":Oil<CR>")
map("n", "<C-x>", ":BufferLineCloseOthers<CR>")
map("n", "<Tab>", ":BufferLineCycleNext<CR>")
map("n", "<s-Tab>", ":BufferLineCyclePrev<CR>")
map("n", "<C-n>", ":GitConflictNextConflict<CR>")

vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(event)
		local bufmap = function(mode, lhs, rhs)
			local opts = { buffer = event.buf, noremap = true, silent = true }
			map(mode, lhs, rhs, opts)
		end
		bufmap("n", "gd", vim.lsp.buf.definition)
		bufmap("n", "gD", vim.lsp.buf.declaration)
		bufmap("n", "gi", vim.lsp.buf.implementation)
		bufmap("n", "gr", vim.lsp.buf.references)
		bufmap("n", "grn", vim.lsp.buf.rename)
		bufmap({ "n", "v" }, "<C-a>", vim.lsp.buf.hover)
	end,
})

map({ "n", "i", "v" }, "<Up>", "<nop>")
map({ "n", "i", "v" }, "<Down>", "<nop>")
map({ "n", "i", "v" }, "<Left>", "<nop>")
map({ "n", "i", "v" }, "<Right>", "<nop>")
