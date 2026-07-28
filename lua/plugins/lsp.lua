return {
	event = "VeryLazy",
	"mason-org/mason-lspconfig.nvim",
	dependencies = {
		{ "mason-org/mason.nvim", opts = {} },
		"neovim/nvim-lspconfig",
		{
			"WhoIsSethDaniel/mason-tool-installer.nvim",
			opts = {
				"prettier",
				"stylua",
			},
		},
	},
	opts = {
		ensure_installed = {
			"lua_ls",
			"ts_ls",
		},
	},
	config = function(_, opts)
		require("mason-lspconfig").setup(opts)

		vim.diagnostic.config({
			virtual_text = {
				spacing = 4,
				-- prefix = "●",
			},
			signs = true,
			underline = true,
			update_in_insert = false,
			severity_sort = true,
			float = {
				border = "rounded",
				source = true,
			},
		})

		-- vim.diagnostic.config({
		-- 	update_in_insert = true,
		-- 	float = {
		-- 		focusable = false,
		-- 		style = "minimal",
		-- 		border = "rounded",
		-- 		source = "always",
		-- 		header = "",
		-- 		prefix = "",
		-- 	},
		-- })

		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("UserLspConfig", { clear = true }),
			callback = function(ev)
				vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Show LSP Info", buffer = ev.buf, remap = false })
				-- vim.keymap.set(
				-- 	"n",
				-- 	"gd",
				-- 	vim.lsp.buf.definition,
				-- 	{ desc = "Go to definiton", buffer = ev.buf, remap = false }
				-- )
				-- vim.keymap.set(
				-- 	"n",
				-- 	"gD",
				-- 	vim.lsp.buf.declaration,
				-- 	{ desc = "Go to declaration", buffer = ev.buf, remap = false }
				-- )
				-- vim.keymap.set(
				-- 	"n",
				-- 	"gi",
				-- 	vim.lsp.buf.implementation,
				-- 	{ desc = "Go to implementation", buffer = ev.buf, remap = false }
				-- )
				-- vim.keymap.set(
				-- 	"n",
				-- 	"gr",
				-- 	vim.lsp.buf.references,
				-- 	{ desc = "Go to references", buffer = ev.buf, remap = false }
				-- )

				vim.keymap.set(
					"n",
					"<leader>cr",
					vim.lsp.buf.rename,
					{ desc = "Code Rename", buffer = ev.buf, remap = false }
				)
				vim.keymap.set(
					{ "n", "v" },
					"<leader>ca",
					vim.lsp.buf.code_action,
					{ desc = "Code Action", buffer = ev.buf, remap = false }
				)
				vim.keymap.set("n", "<leader>cf", function()
					vim.lsp.buf.format({ async = true })
				end, { desc = "Code Format" })

				vim.keymap.set("n", "[d", function()
					vim.diagnostic.jump({ count = -1, float = true })
				end, { desc = "Prev Diagnostic", buffer = ev.buf, remap = false })

				vim.keymap.set("n", "]d", function()
					vim.diagnostic.jump({ count = 1, float = true })
				end, { desc = "Next Diagnostic", buffer = ev.buf, remap = false })

				vim.keymap.set(
					"n",
					"<leader>d",
					vim.diagnostic.open_float,
					{ desc = "Diagnostic Float", buffer = ev.buf, remap = false }
				)
			end,
		})
	end,
}
