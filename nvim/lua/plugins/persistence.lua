return {
	"folke/persistence.nvim",
	event = "BufReadPre", -- this will only start session saving when an actual file was opened
	config = function()
		local keymap = vim.keymap

		-- load the session for the current directory
		keymap.set("n", "<leader>qs", function()
			require("persistence").load()
		end)

		-- select a session to load
		keymap.set("n", "<leader>qS", function()
			require("persistence").select()
		end)

		-- load the last session
		keymap.set("n", "<leader>ql", function()
			require("persistence").load({ last = true })
		end)

		-- stop Persistence => session won't be saved on exit
		keymap.set("n", "<leader>qd", function()
			require("persistence").stop()
		end)
	end,
}
