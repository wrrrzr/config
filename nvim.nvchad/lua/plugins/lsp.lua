local lspconfig = require("lspconfig")
lspconfig.pylsp.setup({
	filetypes = { "python" },
})
lspconfig.clangd.setup({
	filetypes = { "c", "cpp", "objc", "objcpp", "cuda", "proto" },
})
