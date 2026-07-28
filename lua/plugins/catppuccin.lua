return {
	"catppuccin/nvim",
	name = "catppuccin",
	priority = 1000,
	opts = {
		transparent_background = true,
		custom_highlights = function(colors)
			return {
				LineNr = { fg = colors.subtext0 },
				Visual = { bg = colors.surface2 },
				CursorLine = { bg = colors.surface1 },
			}
		end,
	},
	config = function(_, opts)
		require("catppuccin").setup(opts)

		vim.cmd.colorscheme("catppuccin")
	end,
}
