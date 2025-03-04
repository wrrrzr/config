local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
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
	{ "zbirenbaum/copilot.lua" },
	{
		"zbirenbaum/copilot-cmp",
		config = function()
			require("copilot_cmp").setup()
		end,
	},
})

require("copilot").setup({
	panel = {
		enabled = true,
		auto_refresh = false,
		keymap = {
			jump_prev = "[[",
			jump_next = "]]",
			accept = "<CR>",
			refresh = "gr",
			open = "<M-CR>",
		},
		layout = {
			position = "bottom", -- | top | left | right | horizontal | vertical
			ratio = 0.4,
		},
	},
	suggestion = {
		enabled = true,
		auto_trigger = false,
		hide_during_completion = true,
		debounce = 75,
		keymap = {
			accept = "<M-l>",
			accept_word = false,
			accept_line = false,
			next = "<M-]>",
			prev = "<M-[>",
			dismiss = "<C-]>",
		},
	},
	filetypes = {
		yaml = false,
		markdown = false,
		help = false,
		gitcommit = false,
		gitrebase = false,
		hgcommit = false,
		svn = false,
		cvs = false,
		["."] = false,
	},
	copilot_node_command = "node", -- Node.js version must be > 18.x
	server_opts_overrides = {},
})
