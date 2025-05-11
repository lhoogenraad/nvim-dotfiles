vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
	-- Packer
	use 'wbthomason/packer.nvim'

	-- TS
	use {
		'nvim-treesitter/nvim-treesitter',
		run = ':TSUpdate'
	}
	use 'neovim/nvim-lspconfig'
	use {
		'VonHeikemen/lsp-zero.nvim',
		branch = 'v4.x',
		requires = {
			--- Uncomment these if you want to manage LSP servers from neovim
			{'williamboman/mason.nvim'},
			{'williamboman/mason-lspconfig.nvim'},

			{'neovim/nvim-lspconfig'},
			{'hrsh7th/nvim-cmp'},
			{'hrsh7th/cmp-nvim-lsp'},
			{'L3MON4D3/LuaSnip'},
		}
	}

	-- git
	use 'lewis6991/gitsigns.nvim'
	use 'akinsho/git-conflict.nvim'
	use 'tpope/vim-fugitive'

	-- file/buffer navigation
	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.4',
		-- or                            , branch = '0.1.x',
		requires = { {'nvim-lua/plenary.nvim'} }
	}
	use 'ThePrimeagen/harpoon'
	use 'ggandor/leap.nvim'
	use 'mbbill/undotree'

	-- Colour themes
	use 'NLKNguyen/papercolor-theme'
	use "folke/tokyonight.nvim"
	use 'ful1e5/onedark.nvim'
	use 'folke/lsp-colors.nvim'
	use 'folke/twilight.nvim'

	-- visual stuff
	use	{
		'willothy/veil.nvim',
		requires = {
			-- All optional, only required for the default setup.
			-- If you customize your config, these aren't necessary.
			"nvim-telescope/telescope.nvim",
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope-file-browser.nvim"
		}
	}
	use {
		"windwp/nvim-autopairs",
		config = function() require("nvim-autopairs").setup {} end
	}
	use 'windwp/windline.nvim'
	use {
		'numToStr/Comment.nvim',
		config = function()
			require('Comment').setup()
		end
	}
	use 'nvim-tree/nvim-web-devicons'

	-- dev support
	use 'm-demare/hlargs.nvim'
	use({
		"kylechui/nvim-surround",
		tag = "*", 
		config = function()
			require("nvim-surround").setup({})
		end
	})
	use 'tzachar/highlight-undo.nvim'
	use 'edluffy/specs.nvim'
	use 'sontungexpt/stcursorword'
	use 'ErichDonGubler/lsp_lines.nvim'
	use {'kevinhwang91/nvim-ufo', requires = 'kevinhwang91/promise-async'}
	use 'lewis6991/impatient.nvim'
	use({
		"utilyre/barbecue.nvim",
		tag = "*",
		requires = {
			"SmiteshP/nvim-navic",
			"nvim-tree/nvim-web-devicons", -- optional dependency
		},
		after = "nvim-web-devicons", -- keep this if you're using NvChad
		config = function()
			require("barbecue").setup()
		end,
	})
	use 'github/copilot.vim'
	use 'norcalli/nvim-colorizer.lua'
end)
