-- Basic settings for neovim with lazyvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazypath,
	})
end

vim.opt.rtp:prepend(lazypath)
vim.g.mapleader = " "
-- relativenumber
vim.opt.number = true
vim.opt.relativenumber = true

-- Tab
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true

-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- optionally enable 24-bit colour
vim.opt.termguicolors = true

-- Optional: mouse resize
vim.opt.mouse = "a"

--clipboard
vim.opt.clipboard = "unnamedplus"

-- Terminal setup
-- Open terminal in insert mode
vim.api.nvim_create_autocmd("TermOpen", {
	pattern = "*",
	command = "startinsert",
})

-- Easier escape from terminal mode
vim.keymap.set("t", "<Esc>", [[<C-\><C-n>]], { silent = true })

-- Command to open terminal at the bottom (like VS Code)
vim.api.nvim_create_user_command("Term", function()
	vim.cmd("botright split | terminal")
end, {})

-- splits
vim.keymap.set("n", "<leader>sv", ":vsplit<CR>", { desc = "vertical split" })
vim.keymap.set("n", "<leader>sh", ":split<CR>", { desc = "horizontal split" })

-- Move between splits easily (works for terminal too)
vim.keymap.set("n", "<C-h>", "<C-w>h", { silent = true })
vim.keymap.set("n", "<C-l>", "<C-w>l", { silent = true })
vim.keymap.set("n", "<C-j>", "<C-w>j", { silent = true })
vim.keymap.set("n", "<C-k>", "<C-w>k", { silent = true })

-- Terminal mode navigation
vim.keymap.set("t", "<C-h>", [[<C-\><C-n><C-w>h]], { silent = true })
vim.keymap.set("t", "<C-l>", [[<C-\><C-n><C-w>l]], { silent = true })
vim.keymap.set("t", "<C-j>", [[<C-\><C-n><C-w>j]], { silent = true })
vim.keymap.set("t", "<C-k>", [[<C-\><C-n><C-w>k]], { silent = true })

-- Resize splits easily
vim.keymap.set("n", "<C-Up>", ":resize +2<CR>", { silent = true })
vim.keymap.set("n", "<C-Down>", ":resize -2<CR>", { silent = true })
vim.keymap.set("n", "<C-Left>", ":vertical resize -2<CR>", { silent = true })
vim.keymap.set("n", "<C-Right>", ":vertical resize +2<CR>", { silent = true })

--tree sitter :
vim.keymap.set("n", "<leader>n", ":NvimTreeToggle<CR>", { silent = true })
vim.keymap.set("n", "<leader>t", ":NvimTreeFindFile<CR>", { silent = true })

--lsp
vim.keymap.set("n", "]d", function()
	vim.diagnostic.jump({ count = 1, float = true })
end)
vim.keymap.set("n", "[d", function()
	vim.diagnostic.jump({ count = -1, float = true })
end)
vim.keymap.set("n", "gl", vim.diagnostic.open_float, { desc = "open diagnostic" })
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "diagnostic loclist " })
vim.keymap.set("n", "gd", function()
	vim.lsp.buf.definition()
end, { desc = "go to definition" })

require("config.lazy")

--telescope
local builtin = require("telescope.builtin")

vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "find files" })
vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "live grep" })
vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "find buffers" })
vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "find help tags" })

-- colorscheme
vim.cmd.colorscheme("carbonfox")

local function transparent()
	local groups = {
		"Normal",
		"NormalNC",
		"NormalFloat",
		"SignColumn",
		"EndOfBuffer",
		"Terminal",

		-- NvimTree
		"NvimTreeNormal",
		"NvimTreeNormalNC",
		"NvimTreeEndOfBuffer",

		-- optional
		"FloatBorder",
		"TelescopeNormal",
		"TelescopeBorder",
	}

	for _, group in ipairs(groups) do
		vim.api.nvim_set_hl(0, group, { bg = "none" })
	end
end

transparent()

-- reapply after colorscheme changes
vim.api.nvim_create_autocmd("ColorScheme", {
	callback = transparent,
})

vim.opt.background = "dark"
-- reapply when opening nvim-tree
vim.api.nvim_create_autocmd("FileType", {
	pattern = "NvimTree",
	callback = transparent,
})

--format shortcut
vim.keymap.set("n", "<leader>f", function()
	vim.lsp.buf.format()
end)

require("bufferline").setup({})

vim.keymap.set("n", "<Tab>", ":bnext<CR>")
vim.keymap.set("n", "<S-Tab>", ":bprevious<CR>")

vim.keymap.set("n", "<leader>x", function()
	vim.cmd("confirm bd")
end)
