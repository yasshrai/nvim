-- nvim/lua/config/lazy.lua
require("lazy").setup({{
    "nvim-tree/nvim-tree.lua",
    dependencies = {"nvim-tree/nvim-web-devicons"},
    config = function()
        require("nvim-tree").setup({})
    end
}, {
    "williamboman/mason.nvim",
    config = function()
        require("mason").setup()
    end
}, {
    "neovim/nvim-lspconfig",
    dependencies = {"hrsh7th/cmp-nvim-lsp"},
    config = function()
        local capabilities = require("cmp_nvim_lsp").default_capabilities()

        -- C++
        vim.lsp.config("clangd", {
            capabilities = capabilities
        })
        vim.lsp.enable("clangd")

        -- Python
        vim.lsp.config("pyright", {
            capabilities = capabilities
        })
        vim.lsp.enable("pyright")

        -- Go
        vim.lsp.config("gopls", {
            capabilities = capabilities
        })
        vim.lsp.enable("gopls")
        -- TypeScript / React / Next.js
        vim.lsp.config("ts_ls", {
            capabilities = capabilities
        })
        vim.lsp.enable("ts_ls")
        -- tailwindcss
        vim.lsp.config("tailwindcss", {
            capabilities = capabilities
        })
        vim.lsp.enable("tailwindcss")
        -- Rust
        vim.lsp.config("rust_analyzer", {
            capabilities = capabilities
        })
        vim.lsp.enable("rust_analyzer")

        -- Bash / Shell
        vim.lsp.config("bashls", {
            capabilities = capabilities
        })

        vim.lsp.enable("bashls")
        -- Lua
        vim.lsp.config("lua_ls", {
            capabilities = capabilities,
            settings = {
                Lua = {
                    diagnostics = {
                        globals = {"vim"}
                    },
                    workspace = {
                        library = vim.api.nvim_get_runtime_file("", true)
                    }
                }
            }
        })
        vim.lsp.enable("lua_ls")
    end
}, {
    "hrsh7th/nvim-cmp",
    dependencies = {"hrsh7th/cmp-nvim-lsp", "L3MON4D3/LuaSnip"},
    config = function()
        local cmp = require("cmp")

        cmp.setup({
            snippet = {
                expand = function(args)
                    require("luasnip").lsp_expand(args.body)
                end
            },
            mapping = cmp.mapping.preset.insert({
                ["<Tab>"] = cmp.mapping.select_next_item(),
                ["<S-Tab>"] = cmp.mapping.select_prev_item(),
                ["<CR>"] = cmp.mapping.confirm({
                    select = true
                }),
                ["<C-Space>"] = cmp.mapping.complete()
            }),
            sources = {{
                name = "nvim_lsp"
            }}
        })
    end
}, {
    "nvim-telescope/telescope.nvim",
    dependencies = {"nvim-lua/plenary.nvim"}
}, {"vague2k/vague.nvim"},{
    "bluz71/vim-moonfly-colors", name = "moonfly", lazy = false, priority = 1000 

}})
