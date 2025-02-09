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
    { "nvim-lualine/lualine.nvim",      dependencies = { "nvim-tree/nvim-web-devicons" } },
    { "stevearc/oil.nvim",              dependencies = { "nvim-tree/nvim-web-devicons" }, lazy = false },
    { "akinsho/bufferline.nvim",        dependencies = "nvim-tree/nvim-web-devicons" },
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
        "David-Kunz/gen.nvim",
        opts = {
            model = "qwen2.5-coder:3b",
            quit_map = "q",
            retry_map = "<c-r>",
            accept_map = "<c-cr>",
            host = "localhost",
            port = "11434",
            display_mode = "split",
            show_prompt = false,
            show_model = false,
            no_auto_close = false,
            file = false,
            hidden = false,
            command = function(options)
                local body = { model = options.model, stream = true }
                return "curl --silent --no-buffer -X POST http://" ..
                    options.host .. ":" .. options.port .. "/api/chat -d $body"
            end,
            result_filetype = "markdown",
            debug = false
        }
    },
})

require("lualine").setup({
    options = {
        theme = "vscode",
    },
})
