return {
	{ "nvim-treesitter/nvim-treesitter" },
	{ "nvim-lualine/lualine.nvim", dependencies = { "nvim-tree/nvim-web-devicons" } },
	{ "stevearc/oil.nvim", dependencies = { "nvim-tree/nvim-web-devicons" }, lazy = false },
	{ "akinsho/bufferline.nvim", dependencies = "nvim-tree/nvim-web-devicons" },
	{ "neovim/nvim-lspconfig" },

	{ "hrsh7th/cmp-nvim-lsp" },
	{ "hrsh7th/cmp-buffer" },
	{ "hrsh7th/cmp-path" },
	{ "hrsh7th/cmp-cmdline" },
	{ "hrsh7th/nvim-cmp" },
	{ "hrsh7th/cmp-vsnip" },
	{ "hrsh7th/vim-vsnip" },

	{ "stevearc/conform.nvim" },
	{ "Mofiqul/vscode.nvim" },
	{
		"ThePrimeagen/refactoring.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-treesitter/nvim-treesitter",
		},
		config = function()
			require("refactoring").setup()
		end,
	},
	{ "lewis6991/gitsigns.nvim", config = true, lazy = false },
	{
		"ThePrimeagen/refactoring.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-treesitter/nvim-treesitter",
		},
		lazy = false,
		config = function()
			require("refactoring").setup()
		end,
	},
	{ "tpope/vim-fugitive" },
	{
		"olimorris/codecompanion.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-treesitter/nvim-treesitter",
		},
		config = function()
			require("codecompanion").setup({
				strategies = {
					chat = {
						adapter = "ollama-tinyllama",
					},
					inline = {
						adapter = "ollama-tinyllama",
					},
				},
				adapters = {
					["ollama-tinyllama"] = function()
						return require("codecompanion.adapters").extend("ollama", {
							name = "tinyllama",
							env = {
								url = "http://neo:11434",
							},
							schema = {
								model = {
									default = "tinyllama:latest",
								},
								num_ctx = {
									default = 16384,
								},
								num_predict = {
									default = -1,
								},
							},
						})
					end,
				},
			})
		end,
	},
}
