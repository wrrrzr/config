local diagnostic_signs = {
	[vim.diagnostic.severity.ERROR] = "",
	[vim.diagnostic.severity.WARN] = "",
	[vim.diagnostic.severity.INFO] = "",
	[vim.diagnostic.severity.HINT] = "󰌵",
}

local function diagnostic_format(diagnostic)
	return string.format(
		"%s %s (%s): %s",
		diagnostic_signs[diagnostic.severity],
		diagnostic.source,
		diagnostic.code,
		diagnostic.message
	)
end

vim.diagnostic.config({
	virtual_text = {
		spacing = 4,
		prefix = "",
		format = diagnostic_format,
	},
	signs = {
		text = diagnostic_signs,
	},
	virtual_lines = {
		current_line = true,
		format = diagnostic_format,
	},
})
