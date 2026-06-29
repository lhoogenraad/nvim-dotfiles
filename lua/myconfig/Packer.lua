vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer
    use 'wbthomason/packer.nvim'

    ------------------------------------------------------------------
    -- Treesitter / LSP
    ------------------------------------------------------------------

    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate',
    }

    use 'neovim/nvim-lspconfig'

    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v4.x',
        requires = {
            { 'williamboman/mason.nvim' },
            { 'williamboman/mason-lspconfig.nvim' },

            { 'neovim/nvim-lspconfig' },

            { 'hrsh7th/nvim-cmp' },
            { 'hrsh7th/cmp-nvim-lsp' },

            { 'L3MON4D3/LuaSnip' },
        }
    }

    ------------------------------------------------------------------
    -- Git
    ------------------------------------------------------------------

    use 'lewis6991/gitsigns.nvim'
    use 'akinsho/git-conflict.nvim'
    use 'tpope/vim-fugitive'

    ------------------------------------------------------------------
    -- Navigation
    ------------------------------------------------------------------

    use {
        'nvim-telescope/telescope.nvim',
        requires = {
            'nvim-lua/plenary.nvim',
        }
    }

	use "ThePrimeagen/harpoon"

    use 'https://codeberg.org/andyg/leap.nvim'
    use 'mbbill/undotree'

    ------------------------------------------------------------------
    -- Themes
    ------------------------------------------------------------------

    use 'NLKNguyen/papercolor-theme'
    use 'folke/tokyonight.nvim'
    use 'ful1e5/onedark.nvim'
    use 'folke/lsp-colors.nvim'
    use 'folke/twilight.nvim'

    ------------------------------------------------------------------
    -- UI
    ------------------------------------------------------------------

    use {
        'willothy/veil.nvim',
        requires = {
            'nvim-lua/plenary.nvim',
            'nvim-telescope/telescope.nvim',
            'nvim-telescope/telescope-file-browser.nvim',
        }
    }

    use {
        'windwp/nvim-autopairs',
        config = function()
            require('nvim-autopairs').setup({})
        end,
    }

    use 'windwp/windline.nvim'

    use {
        'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup()
        end,
    }

    use 'nvim-tree/nvim-web-devicons'

    ------------------------------------------------------------------
    -- Development
    ------------------------------------------------------------------

    use 'm-demare/hlargs.nvim'

    use {
        'kylechui/nvim-surround',
        tag = '*',
        config = function()
            require('nvim-surround').setup({})
        end,
    }

    use 'tzachar/highlight-undo.nvim'
    use 'edluffy/specs.nvim'
    use 'sontungexpt/stcursorword'
    use 'ErichDonGubler/lsp_lines.nvim'

    use {
        'kevinhwang91/nvim-ufo',
        requires = 'kevinhwang91/promise-async',
    }

    use {
        'utilyre/barbecue.nvim',
        tag = '*',
        requires = {
            'SmiteshP/nvim-navic',
            'nvim-tree/nvim-web-devicons',
        },
        after = 'nvim-web-devicons',
        config = function()
            require('barbecue').setup()
        end,
    }

    ------------------------------------------------------------------
    -- Misc
    ------------------------------------------------------------------

    use 'github/copilot.vim'

    use 'norcalli/nvim-colorizer.lua'

    use 'j-hui/fidget.nvim'

end)
