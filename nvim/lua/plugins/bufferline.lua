return {
	"akinsho/bufferline.nvim",
	version = "*",
	config = function()
		vim.opt.termguicolors = true
		require("bufferline").setup({
			options = {
				mode = "tabs",
				show_buffer_close_icons = true,
			},
			highlights = {
				fill = { bg = "none" },
				background = { bg = "none" },
				separator = { bg = "none" },
				separator_selected = { bg = "none" },
			},
		})

		local set = vim.keymap.set
		local opts = { silent = true }

		-- navigation
		set("n", "[b", "<cmd>BufferLineCyclePrev<cr>", { desc = "Previous Buffer" })
		set("n", "]b", "<cmd>BufferLineCycleNext<cr>", { desc = "Next Buffer" })
		set("n", "<Tab>", "<cmd>BufferLineCycleNext<cr>", { desc = "Next Buffer" })

		-- reorder
		set("n", "<leader>b<left>", "<cmd>BufferLineMovePrev<cr>", { desc = "Move Buffer Left" })
		set("n", "<leader>b<right>", "<cmd>BufferLineMoveNext<cr>", { desc = "Move Buffer Right" })

		-- closing
		set("n", "<leader>bc", "<cmd>BufferLineClose<cr>", { desc = "Close Current Buffer" })
		set("n", "<leader>bo", "<cmd>BufferLineCloseOthers<cr>", { desc = "Close Other Buffers" })
		set("n", "<leader>bl", "<cmd>BufferLineCloseLeft<cr>", { desc = "Close Buffers to the Left" })
		set("n", "<leader>br", "<cmd>BufferLineCloseRight<cr>", { desc = "Close Buffers to the Right" })

		-- utilities
		set("n", "<leader>b#", "<cmd>BufferLineGoToBuffer<cr>", { desc = "Go to Buffer by Number" })
		set("n", "<leader>bp", "<cmd>BufferLineTogglePin<cr>", { desc = "Toggle Pin Buffer" })
	end,
}
