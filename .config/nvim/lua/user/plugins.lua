vim.opt.termguicolors = true

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Example using a list of specs with the default options
vim.g.mapleader = " " -- Make sure to set `mapleader` before lazy so your mappings are correct

require("lazy").setup({
    "navarasu/onedark.nvim",
    "neovim/nvim-lspconfig",
    "m4xshen/smartcolumn.nvim",
    "airblade/vim-gitgutter",
    "hkupty/iron.nvim",
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        init = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 300
        end,
        opts = {}
    },
    {
        "nvim-neorg/neorg",
        build = ":Neorg sync-parsers",
        -- tag = "*",
        dependencies = { "nvim-lua/plenary.nvim" },
    },
    {
        'nvimtools/none-ls.nvim', dependencies = {'nvim-lua/plenary.nvim',}
    },

    {
        'hrsh7th/nvim-cmp',
        dependencies = { "nvim-web-devicons", "onsails/lspkind.nvim"}
    },

	'hrsh7th/cmp-nvim-lsp',
	'hrsh7th/cmp-nvim-lsp-signature-help',
	'hrsh7th/cmp-buffer',
	'hrsh7th/cmp-path',
	'f3fora/cmp-spell',

	'SirVer/ultisnips',
	'honza/vim-snippets',
	'quangnguyen30192/cmp-nvim-ultisnips',



	{ 
		"nvim-tree/nvim-tree.lua", version = "*", lazy = false,
		dependencies = { "nvim-tree/nvim-web-devicons", },
	},
	{ 'numToStr/Comment.nvim', lazy = false, },
	{ "kylechui/nvim-surround", version = "*", event = "VeryLazy", },
	{ 'windwp/nvim-autopairs', event = "InsertEnter", },
	{
		"nvim-lualine/lualine.nvim",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
	},
	{
		"folke/trouble.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
	},
	{
		'nvim-telescope/telescope.nvim', tag = '0.1.5',
		dependencies = { 'nvim-lua/plenary.nvim' }
	},
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
	},
	'nvim-treesitter/nvim-treesitter-textobjects',
})
