vim.opt.clipboard = "unnamedplus"

vim.keymap.set({ "n", "i", "v" }, "<C-s>", "<Cmd>w<CR>", {
	silent = true,
	desc = "Save file (Ctrl-S)",
})

-- Sets the display width of a hard tab character to 4 columns
vim.opt.tabstop = 4
-- Sets the width of an indent level to 4 columns
vim.opt.shiftwidth = 4
-- Converts tabs to spaces when you press the <Tab> key
vim.opt.expandtab = true
-- Optional: Makes the <Tab> and <Backspace> keys work like a 4-space tab stop
vim.opt.softtabstop = 4
