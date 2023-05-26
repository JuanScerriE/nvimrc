local keymap = vim.keymap

local telescope = require("telescope")

telescope.setup({
	extensions = {
		fzf = {
			fuzzy = true,
			override_generic_sorter = true, -- override the generic sorter
			override_file_sorter = true, -- override the file sorter
			case_mode = "smart_case",
		},
	},
})

telescope.load_extension("fzf")

local builtin = require("telescope.builtin")

keymap.set("n", "<leader>ff", builtin.git_files, { desc = "Find files" })
keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Grep in files" })
keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Find buffers" })
keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Find help" })