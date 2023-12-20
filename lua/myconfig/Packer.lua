vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
	-- Packer can manage itself
	use 'wbthomason/packer.nvim'
	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.4',
		-- or                            , branch = '0.1.x',
		requires = { {'nvim-lua/plenary.nvim'} }
	}
	use ({'nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'}})
	use {
		'VonHeikemen/lsp-zero.nvim',
		branch = 'v3.x',
		requires = {
			--- Uncomment these if you want to manage LSP servers from neovim
			{'williamboman/mason.nvim'},
			{'williamboman/mason-lspconfig.nvim'},

			-- LSP Support
			{'neovim/nvim-lspconfig'},
			-- Autocompletion
			{'hrsh7th/nvim-cmp'},
			{'hrsh7th/cmp-nvim-lsp'},
			{'L3MON4D3/LuaSnip'},
		}
	}


	-- git
	use 'lewis6991/gitsigns.nvim'

	use 'ThePrimeagen/harpoon'
	use 'ggandor/leap.nvim'
	use 'mbbill/undotree'

	-- Colour themes
	use 'NLKNguyen/papercolor-theme'
	use "folke/tokyonight.nvim"
	use 'ful1e5/onedark.nvim'
	use 'folke/lsp-colors.nvim'
	use 'm-demare/hlargs.nvim'

	use {
		"windwp/nvim-autopairs",
		config = function() require("nvim-autopairs").setup {} end
	}

	use {
		'jinh0/eyeliner.nvim',
		config = function()
			require('eyeliner').setup {
				highlight_on_key=true,
				dim=false
			}
		end
	}
	use 'windwp/windline.nvim'
	use {
		'numToStr/Comment.nvim',
		config = function()
			require('Comment').setup()
		end
	}

	use 'nvim-tree/nvim-web-devicons'

	use({
		"kylechui/nvim-surround",
		tag = "*", 
		config = function()
			require("nvim-surround").setup({})
		end
	})

	use 'HiPhish/nvim-ts-rainbow2'
	use 'lukas-reineke/indent-blankline.nvim'
	use 'tzachar/highlight-undo.nvim'
	use 'karb94/neoscroll.nvim'

	use { 'gen740/SmoothCursor.nvim',
	config = function()
		require('smoothcursor').setup()
	end
}

use {"folke/noice.nvim", requires = {"MunifTanjim/nui.nvim", "rcarriga/nvim-notify"}}

use 'DanilaMihailov/beacon.nvim'
use 'willothy/veil.nvim'

use 'ErichDonGubler/lsp_lines.nvim'
use {'kevinhwang91/nvim-ufo', requires = 'kevinhwang91/promise-async'}
use 'lewis6991/impatient.nvim'
use "m4xshen/smartcolumn.nvim"
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
end)
