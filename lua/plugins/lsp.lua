return {
	"neovim/nvim-lspconfig",
	dependencies = { "hrsh7th/cmp-nvim-lsp" },
	config = function()
		local capabilities = require("cmp_nvim_lsp").default_capabilities()

		-- C++
		vim.lsp.config("clangd", {
			capabilities = capabilities,
		})
		vim.lsp.enable("clangd")

		-- Python
		vim.lsp.config("pyright", {
			capabilities = capabilities,
		})
		vim.lsp.enable("pyright")

		-- Go
		vim.lsp.config("gopls", {
			capabilities = capabilities,
		})
		vim.lsp.enable("gopls")
		-- TypeScript / React / Next.js
		vim.lsp.config("ts_ls", {
			capabilities = capabilities,
		})
		vim.lsp.enable("ts_ls")
		-- tailwindcss
		vim.lsp.config("tailwindcss", {
			capabilities = capabilities,
		})
		vim.lsp.enable("tailwindcss")
		-- Rust
		vim.lsp.config("rust_analyzer", {
			capabilities = capabilities,
		})
		vim.lsp.enable("rust_analyzer")

		-- Bash / Shell
		vim.lsp.config("bashls", {
			capabilities = capabilities,
		})

		vim.lsp.enable("bashls")
		-- Lua
		vim.lsp.config("lua_ls", {
			capabilities = capabilities,
			settings = {
				Lua = {
					diagnostics = {
						globals = { "vim" },
					},
					workspace = {
						library = vim.api.nvim_get_runtime_file("", true),
					},
				},
			},
		})
		vim.lsp.enable("lua_ls")
		-- Docker
		vim.lsp.config("dockerls", {
			capabilities = capabilities,
		})

		vim.lsp.enable("dockerls")
		-- Docker Compose
		vim.lsp.config("docker_compose_language_service", {
			capabilities = capabilities,
		})

		vim.lsp.enable("docker_compose_language_service")
	end,
}
