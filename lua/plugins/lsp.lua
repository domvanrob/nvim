return {
	"mason-org/mason-lspconfig.nvim",
	opts = {
		ensure_installed = {
			"lua_ls",
			"ts_ls",
		},
	},
	dependencies = {
		{ "mason-org/mason.nvim", opts = {} },
		"neovim/nvim-lspconfig",
	},
	config = function(_, opts)
		require("mason-lspconfig").setup(opts)

		-- vim.diagnostic.config({
		-- 	virtual_text = {
		-- 		spacing = 4,
		-- 		prefix = "●",
		-- 	},
		-- 	signs = true,
		-- 	underline = true,
		-- 	update_in_insert = false,
		-- 	severity_sort = true,
		-- 	float = {
		-- 		border = "rounded",
		-- 		source = true,
		-- 	},
		-- })

		vim.diagnostic.config({
			-- update_in_insert = true,
			float = {
				focusable = false,
				style = "minimal",
				border = "rounded",
				source = "always",
				header = "",
				prefix = "",
			},
		})

		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("UserLspConfig", { clear = true }),
			callback = function(ev)
				local map_opts = { buffer = ev.buf, remap = false }

				vim.keymap.set("n", "K", vim.lsp.buf.hover, map_opts)
				vim.keymap.set("n", "gd", vim.lsp.buf.definition, map_opts)
				vim.keymap.set("n", "gD", vim.lsp.buf.declaration, map_opts)
				vim.keymap.set("n", "gi", vim.lsp.buf.implementation, map_opts)
				vim.keymap.set("n", "gr", vim.lsp.buf.references, map_opts)
				vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, map_opts)
				vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, map_opts)

				vim.keymap.set("n", "[d", function()
					vim.diagnostic.jump({ count = -1, float = true })
				end, map_opts)

				vim.keymap.set("n", "]d", function()
					vim.diagnostic.jump({ count = 1, float = true })
				end, map_opts)

				vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, map_opts)
			end,
		})
	end,
}
