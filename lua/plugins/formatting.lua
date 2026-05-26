return {
	"stevearc/conform.nvim",
	event = { "BufWritePre" },

	opts = {
		format_on_save = {
			timeout_ms = 500,
			lsp_fallback = true,
		},

		formatters_by_ft = {
			lua = { "stylua" },
			go = { "goimports", "gofmt" },

			javascript = { "prettier" },
			typescript = { "prettier" },
			javascriptreact = { "prettier" },
			typescriptreact = { "prettier" },

			python = { "black" },

			rust = { "rustfmt" },

			c = { "clang-format" },
			cpp = { "clang-format" },

			sh = { "shfmt" },
		},
	},
}
