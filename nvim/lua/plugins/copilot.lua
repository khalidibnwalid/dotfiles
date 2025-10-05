return {
	"github/copilot.vim",
	--  event = { "BufReadPre", "BufNewFile" },
	-- You can choose a lazy-loading strategy, or set lazy = false for immediate load.
	-- Since Copilot is generally used all the time, setting lazy = false or using an early event might be preferred.
	lazy = false, -- Load immediately on startup
	-- Or use an event:
	-- event = "VimEnter",

	-- You might also want to add a setup command to run after installation:
	-- config = function()
	--   vim.cmd('Copilot setup')
	--   -- Add any custom keymaps or global variables here, for example:
	--   -- To disable the default <Tab> mapping and set your own:
	--   -- vim.g.copilot_no_tab_map = true
	--   -- vim.keymap.set('i', '<C-j>', 'copilot#Accept("\\<CR>")', { expr = true, replace_keycodes = false })
	-- end,
}
