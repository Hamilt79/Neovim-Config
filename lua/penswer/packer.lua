-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
	-- Packer can manage itself
	use 'wbthomason/packer.nvim'

	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.5',
		-- or                            , branch = '0.1.x',
		requires = { {'nvim-lua/plenary.nvim'} }
	}

	--use {'rose-pine/neovim', as = 'rose-pine' }

	--vim.cmd('colorscheme rose-pine')

	use {
		'nvim-treesitter/nvim-treesitter',
		run = ':TSUpdate'
	}

--	use {
--		'mbbill/undotree'
--	}


	--use { 'github/copilot.vim' }

	--	use {'stevearc/dressing.nvim'}

	use {
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"neovim/nvim-lspconfig",
	}

	use { 'nvim-treesitter/nvim-treesitter-context' }

--	use {
--		'nvim-tree/nvim-tree.lua',
--		requires = {
--			'nvim-tree/nvim-web-devicons', -- optional
--		},
--	}

	use {
		'nvim-lualine/lualine.nvim',
		requires = { 'nvim-tree/nvim-web-devicons', opt = true }
	}

	use { 'smolck/command-completion.nvim' }


	--use {'neovim/nvim-lspconfig'}
	use {'hrsh7th/cmp-nvim-lsp'}
	use {'hrsh7th/cmp-buffer'}
	use {'hrsh7th/cmp-path'}
	use {'hrsh7th/cmp-cmdline'}
	use {'hrsh7th/nvim-cmp'}

	use({
		"L3MON4D3/LuaSnip",
		-- follow latest release.
		tag = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
		-- install jsregexp (optional!:).
		run = "make install_jsregexp"
	})

	-- ColorSchemes
	--use { 'bluz71/vim-moonfly-colors', as='moonfly' }
	use { 'ellisonleao/gruvbox.nvim' }
	use { 'scottmckendry/cyberdream.nvim' }


	--use {'ThePrimeagen/vim-be-good' }

   -- use {
   --     'chipsenkbeil/distant.nvim',
   --     branch = 'v0.3',
   --     config = function()
   --         require('distant'):setup()
   --     end
   -- }

    use { 'alvan/vim-closetag' }

    -- 	use { 
        -- 		'mfussenegger/nvim-dap',
        -- 		requires = { 'rcarriga/nvim-dap-ui' }
        -- 		
        -- 		
        -- }

    end)
