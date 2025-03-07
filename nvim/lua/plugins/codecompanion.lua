return {
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
