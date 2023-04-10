vim.cmd [[packadd packer.nvim]]
return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.1',
        -- or                            , branch = '0.1.x',
        requires = { {'nvim-lua/plenary.nvim'} }
    }

    use ('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate'})

    use 'rmehri01/onenord.nvim'
    use 'ray-x/aurora'
    use({
	    'ramojus/mellifluous.nvim',
	    requires = { 'rktjmp/lush.nvim' },
	    config = function()
		    require'mellifluous'.setup({ --[[...]] }) -- optional, see configuration section.
		    vim.cmd('colorscheme mellifluous')
	    end,
    })

    use 'theprimeagen/harpoon'
    use 'mbbill/undotree'

    use 'mofiqul/vscode.nvim'
    use 'rafcamlet/nvim-luapad'
    use 'ful1e5/onedark.nvim'
    use {
        'nvim-lualine/lualine.nvim',
        requires = {'nvim-tree/nvim-web-devicons', opt=true}
    }
end)
