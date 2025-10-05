local M = {}

local colors = {
	bg = "#131317",
	fg = "#e5e1e7",
	red = "#CF505D",
	green = "#80AC5A",
	yellow = "#E4B75C",
	orange = "#C49168",
	blue = "#7BA1C8",
	magenta = "#AC7DA4",
	purple = "#A3A1D6",
	cyan = "#5BBEBC",
	gray = "#E5E9F0",
	light_gray = "#4C566A", -- A new lighter gray for comments/status
}

function M.colorscheme()
	vim.cmd("highlight clear")
	vim.cmd("syntax reset")

	vim.o.background = "dark"
	vim.g.colors_name = "purple-black"

	local set = vim.api.nvim_set_hl

	-- The "Normal" group defines the background for the editor window
	set(0, "Normal", { bg = "None", fg = colors.fg })
	-- The "Comment" group is often a muted/light_gray color
	set(0, "Comment", { fg = colors.light_gray, italic = true })

	-- Line Numbers
	set(0, "LineNr", { fg = colors.light_gray, bg = colors.bg })

	-- Visual Mode Selection
	set(0, "Visual", { bg = colors.light_gray, fg = colors.bg })

	-- Search Results
	set(0, "Search", { bg = colors.yellow, fg = colors.bg })

	-- Status Line (often uses a contrasting color)
	set(0, "StatusLine", { bg = colors.light_gray, fg = colors.bg })
	set(0, "StatusLineNC", { bg = colors.light_gray, fg = colors.bg })

	-- Common Syntax Groups:colorscheme

	-- Statement (e.g., if, else, for, return, local)
	set(0, "Statement", { fg = colors.magenta })
	set(0, "Keyword", { fg = colors.magenta })

	-- Constant (e.g., true, false, nil, numbers)
	set(0, "Constant", { fg = colors.yellow })
	set(0, "Number", { fg = colors.yellow })
	set(0, "Boolean", { fg = colors.yellow })
	set(0, "Character", { fg = colors.orange })
	set(0, "String", { fg = colors.orange })

	-- Identifier (e.g., variable names, function calls)
	set(0, "Identifier", { fg = colors.blue })

	-- Function/Method names
	set(0, "Function", { fg = colors.purple })

	-- PreProcessor statements (e.g., #include, require)
	set(0, "PreProc", { fg = colors.blue })

	-- Type (e.g., int, string, class)
	set(0, "Type", { fg = colors.cyan })

	-- Special/Punctuation
	set(0, "Special", { fg = colors.red })

	-- Error and Warning messages
	set(0, "Error", { fg = colors.bg, bg = colors.red })
	set(0, "WarningMsg", { fg = colors.yellow, bg = colors.bg })
end

return M
