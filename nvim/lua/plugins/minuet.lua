return {
	{
		{
			"milanglacier/minuet-ai.nvim",
			config = function()
				require("minuet").setup({
					virtualtext = {
						auto_trigger_ft = {},
						keymap = {
							accept = "<A-A>",
							accept_line = "<A-a>",
							accept_n_lines = "<A-z>",
							prev = "<A-[>",
							next = "<A-]>",
							dismiss = "<A-e>",
						},
					},
					provider = "openai_fim_compatible",
					n_completions = 1,
					context_window = 512,
					provider_options = {
						openai_fim_compatible = {
							api_key = "TERM",
							name = "Ollama",
							end_point = "http://neo:11434/v1/completions",
							model = "qwen2.5-coder:0.5b",
							optional = {
								max_tokens = 56,
								top_p = 0.9,
							},
						},
					},
				})
			end,
		},
		{ "nvim-lua/plenary.nvim" },
		{ "hrsh7th/nvim-cmp" },
	},
}
