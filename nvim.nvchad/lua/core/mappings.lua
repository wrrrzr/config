local map = vim.keymap.set

map("n", "-", ":Oil<CR>")
map("n", "<C-x>", ":BufferLineCloseOthers<CR>")
map("n", "<Tab>", ":BufferLineCycleNext<CR>")
map("n", "<s-Tab>", ":BufferLineCyclePrev<CR>")

vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(event)
		local bufmap = function(mode, lhs, rhs)
			local opts = { buffer = event.buf, noremap = true, silent = true }
			map(mode, lhs, rhs, opts)
		end
		bufmap("n", "gd", ":lua vim.lsp.buf.definition()<CR>")
		bufmap("n", "gD", ":lua vim.lsp.buf.declaration()<CR>")
		bufmap("n", "gi", ":lua vim.lsp.buf.implementation()<CR>")
		bufmap("n", "gr", ":lua vim.lsp.buf.references()<CR>")
	end,
})

map("n", "<Up>", "<nop>")
map("n", "<Down>", "<nop>")
map("n", "<Left>", "<nop>")
map("n", "<Right>", "<nop>")

map("i", "<Up>", "<nop>")
map("i", "<Down>", "<nop>")
map("i", "<Left>", "<nop>")
map("i", "<Right>", "<nop>")
