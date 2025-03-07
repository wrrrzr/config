local hidden_files = {
	"__pycache__",
	"venv",
	".git",
	"..",
	".mypy_cache",
}

local function is_hidden(name, bufnr)
	for i, k in ipairs(hidden_files) do
		if k == name then
			return true
		end
	end
	return false
end

require("oil").setup({
	default_file_explorer = true,
	columns = { "icon" },
	view_options = {
		show_hidden = false,
		is_hidden_file = is_hidden,
	},
})
