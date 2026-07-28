return {
	{
		"nvim-mini/mini.comment",
		event = "VeryLazy",
	},
	{ "nvim-mini/mini.notify", opts = {} },
	{
		"nvim-mini/mini.ai",
		event = "VeryLazy",
		opts = {},
	},
	{
		"nvim-mini/mini.pairs",
		event = "VeryLazy",
		opts = {},
	},
	{
		"echasnovski/mini.snippets",
		event = "VeryLazy",
		dependencies = { "rafamadriz/friendly-snippets" },
		config = function()
			local gen_loader = require("mini.snippets").gen_loader
			require("mini.snippets").setup({
				snippets = { gen_loader.from_lang() },
			})
			require("mini.snippets").start_lsp_server()
		end,
	},
	{
		"echasnovski/mini.completion",
		event = "VeryLazy",
		opts = {},
		config = function(_, opts)
			require("mini.completion").setup(opts)

			vim.api.nvim_create_autocmd("FileType", {
				pattern = "snacks_picker_input",
				desc = "Disable mini.completion for snacks picker",
				group = vim.api.nvim_create_augroup("user_mini", {}),
				command = "lua vim.b.minicompletion_disable=true",
			})
		end,
	},
	{
		"echasnovski/mini.icons",
		event = "VeryLazy",
		opts = {},
		config = function(_, opts)
			require("mini.icons").setup(opts)
			require("mini.icons").tweak_lsp_kind()
		end,
	},
	{
		"nvim-mini/mini.files",
		event = "VeryLazy",
		keys = {
			{
				"<leader>ef",
				function()
					local buf_name = vim.api.nvim_buf_get_name(0)
					-- Open in current file's directory, or CWD if current buffer has no file
					if vim.fn.filereadable(buf_name) == 1 then
						require("mini.files").open(buf_name)
					else
						require("mini.files").open()
					end
				end,
				desc = "Open mini.files (Directory of current file)",
			},
			{
				"<leader>ee",
				function()
					require("mini.files").open()
				end,
				desc = "Open mini.files (CWD)",
			},
		},
	},
	{
		"nvim-mini/mini.surround",
		event = "VeryLazy",
		opts = {
			mappings = {
				add = "sa", -- Add surrounding in Normal and Visual modes
				delete = "sd", -- Delete surrounding
				find = "sf", -- Find surrounding (to the right)
				find_left = "sF", -- Find surrounding (to the left)
				highlight = "sh", -- Highlight surrounding
				replace = "sr", -- Replace surrounding

				suffix_last = "l", -- Suffix to search with "prev" method
				suffix_next = "n", -- Suffix to search with "next" method
			},
		},
	},
	{
		"nvim-mini/mini.splitjoin",
		event = "VeryLazy",
		opts = {
			mappings = {
				toggle = "gS",
				split = "",
				join = "",
			},
		},
	},
}
