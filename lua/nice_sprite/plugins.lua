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

    use 'theprimeagen/harpoon'
    use 'mbbill/undotree'

    -- colorschemes + related aesthetics
    use 'mofiqul/vscode.nvim'
    use 'rafcamlet/nvim-luapad'
    use 'ful1e5/onedark.nvim'
    use 'tribela/vim-transparent'

    use 'nvim-tree/nvim-web-devicons'
    use 'hrsh7th/cmp-nvim-lsp-signature-help'

    use {
        'nvim-lualine/lualine.nvim',
        requires = {'nvim-tree/nvim-web-devicons', opt=false}
    }
    use 'sainnhe/everforest'
    use 'folke/tokyonight.nvim'

    -- LSP stuff 
    use 'neovim/nvim-lspconfig'
    use 'folke/trouble.nvim'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/nvim-cmp'
    use 'hrsh7th/vim-vsnip'
    use 'RRethy/vim-illuminate'
    use 'Maan2003/lsp_lines.nvim'


    --[[ use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v2.x',
        requires = {
            -- LSP Support
            {'neovim/nvim-lspconfig'},             -- Required
            {                                      -- Optional
            'williamboman/mason.nvim',
            run = function()
                pcall(vim.cmd, 'MasonUpdate')
            end,
        },
        {'williamboman/mason-lspconfig.nvim'}, -- Optional

        -- Autocompletion
        {'hrsh7th/nvim-cmp'},     -- Required
        {'hrsh7th/cmp-nvim-lsp'}, -- Required
        {'L3MON4D3/LuaSnip'},     -- Required
    } 
}--]]
end)
