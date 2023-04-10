let $PATH = "C:/Program Files/Git/usr/bin;" . $PATH

set noswapfile
let g:neovide_refresh_rate=144 
set guifont=jetbrains\ mono:h12
" set guifont=rec\ mono\ linear:h10

"set guifont=terminus\ (ttf)\ for\ windows:h12
"set guifont=gohufont-14\ regular:h14
" set guifont=cascadia\ code:h12
let g:neovide_cursor_animation_length=0.01
set termguicolors
set culopt "number"
set mouse=nvi
set cc=80

" avoid freezing the vim process forever, see
" https://github.com/neovim/neovim/issues/6660
if has('win32')
    nmap <C-z> <Nop>
endif

set guicursor=n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50
		  \,a:blinkwait100-blinkoff250-blinkon250-Cursor/lCursor
		  \,sm:block-blinkwait175-blinkoff150-blinkon175

call plug#begin()

Plug 'junegunn/vim-easy-align'
" Plugin outside ~/.vim/plugged with post-update hook
" Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
" Plug 'junegunn/fzf.vim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.1' }

Plug 'airblade/vim-rooter' 
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" color schemes
Plug 'junegunn/seoul256.vim'
Plug 'NLKNguyen/papercolor-theme'
Plug 'bluz71/vim-moonfly-colors'
Plug 'deathlyfrantic/vim-distill'
Plug 'deathlyfrantic/vim-distinguished'
Plug 'folke/tokyonight.nvim'
Plug 'jacoborus/tender.vim'
Plug 'kaicataldo/material.vim', { 'branch': 'main' }
Plug 'kyazdani42/nvim-tree.lua'
Plug 'Everblush/everblush.vim'
Plug 'nvim-lualine/lualine.nvim'
Plug 'sainnhe/everforest'
Plug 'tiagovla/tokyodark.nvim'
Plug 'tomasiser/vim-code-dark'
Plug 'vim-scripts/midnight2.vim'
Plug 'vim-scripts/northland.vim'
Plug 'cranberry-clockworks/coal.nvim'
Plug 'carlobaldassi/charcoal.vim'
Plug 'sainnhe/gruvbox-material'
" Plug 'p00f/nvim-ts-rainbow'
Plug 'arcticicestudio/nord-vim'
Plug 'nyoom-engineering/oxocarbon.nvim'

"  motion plugins
Plug 'tpope/vim-obsession'
Plug 'tpope/vim-surround'

" Lsp shit
Plug 'DingDean/wgsl.vim'
Plug 'beyondmarc/hlsl.vim'
Plug 'folke/trouble.nvim'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'ray-x/lsp_signature.nvim'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/vim-vsnip'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'neovim/nvim-lspconfig'
Plug 'simrat39/rust-tools.nvim'
Plug 'RRethy/vim-illuminate'

" Language support 
Plug 'nvim-lua/completion-nvim'
" Plug 'rust-lang/rust.vim'

call plug#end()

syntax enable
filetype plugin indent on
let g:rustfmt_autosave = 1
set signcolumn=no
let mapleader = " " 
nnoremap <leader>e :NvimTreeToggle<CR>

nnoremap <C-p> <cmd>lua require('telescope.builtin').find_files()<CR>
nnoremap <leader>ff <cmd>lua require('telescope.builtin').live_grep()<CR>
" Customize fzf colors to match your color scheme


let g:netrw_banner = 0
let g:netrw_winsize=25
"let g:netrw_liststyle=3

set bg=dark
" colorscheme seoul256 
" colorscheme nord 
let g:seoul256_background = 233 
colorscheme oxocarbon  
" hi Normal ctermbg=16 guibg=#0f0f0f
" Add `:Format` command to format current buffer.
command! -nargs=0 Darken hi Normal ctermbg=16 guibg=#030303
command! -nargs=0 Bluen hi Normal ctermbg=16 guibg=#000f1f
Darken


set nu
set nowrap
set expandtab ts=4 sw=4 ai

set completeopt=menuone,noinsert,noselect
set shortmess+=c

" tab nav 
nnoremap <C-Up>    :tabnew<cr>
nnoremap <C-Right> :tabn<cr>
nnoremap <C-Left>  :tabp<cr>
nnoremap <C-Down>  :tabc<cr>



" Code navigation shortcuts
nnoremap <silent> <c-]> <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> K     <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> gD    <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> <c-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> 1gD   <cmd>lua vim.lsp.buf.type_definition()<CR>
nnoremap <silent> gr    <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> g0    <cmd>lua vim.lsp.buf.document_symbol()<CR>
nnoremap <silent> gW    <cmd>lua vim.lsp.buf.workspace_symbol()<CR>
nnoremap <silent> gd    <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> <F2>  <cmd>lua vim.lsp.buf.rename()<CR>





lua <<EOF
require('lualine').setup()

require("trouble").setup {
  -- your configuration comes here
  -- or leave it empty to use the default settings
  -- refer to the configuration section below
}
--vim.g.tokyonight_style = "storm"
-- vim.cmd[[colorscheme tokyonight]]

require'nvim-treesitter.configs'.setup {
    highlight = {
    enable = true,
    use_languagetree = true,
    custom_captures = {
        -- Highlight the @foo.bar capture group with the "Identifier" highlight group.
        ["foo.bar"] = "Identifier",
        },
    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
    },
    rainbow = {
        enable = true,
        extended_mode = true,
        max_file_lines = nil,
        colors = {
            "#cc241d", 
            "#a89984", 
            "#b16286", 
            "#d79921", 
            "#689d6a", 
            "#d65d0e", 
            "#458588", 
        },
        termcolors = { 
            "Red", 
            "Green", 
            "Yellow", 
            "Blue", 
            "Magenta", 
            "Cyan", 
            "White", 
        }, 
    }
}

-- following options are the default
-- each of these are documented in `:help nvim-tree.OPTION_NAME`
require'nvim-tree'.setup {
  disable_netrw        = false,
  hijack_netrw         = false,
  open_on_setup        = false,
  ignore_ft_on_setup   = {},
  auto_reload_on_write = true,
  open_on_tab          = false,
  hijack_cursor        = false,
  update_cwd           = false,
  hijack_unnamed_buffer_when_opening = false,
  hijack_directories   = {
    enable = true,
    auto_open = true,
  },
  renderer  = {
      icons = { 
          show = {
              file = false, 
              folder = false,
              folder_arrow = false,
              git = false 
              }
          }
      },
  diagnostics = {
    enable = false,
    icons = {
      hint = "",
      info = "",
      warning = "",
      error = "",
    }
  },
  update_focused_file = {
    enable      = false,
    update_cwd  = false,
    ignore_list = {}
  },
  system_open = {
    cmd  = nil,
    args = {}
  },
  filters = {
    dotfiles = false,
    custom = {}
  },
  git = {
    enable = true,
    ignore = true,
    timeout = 500,
  },
  view = {
    width = 30,
    hide_root_folder = false,
    side = 'left',
    preserve_window_proportions = false,
    mappings = {
      custom_only = false,
      list = {}
    },
    number = false,
    relativenumber = false,
    signcolumn = "yes"
  },
  trash = {
    cmd = "trash",
    require_confirm = true
  },
  actions = {
    change_dir = {
      enable = true,
      global = false,
    },
    open_file = {
      quit_on_open = false,
      window_picker = {
        enable = true,
        chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890",
        exclude = {
          filetype = {
            "notify",
            "packer",
            "qf"
          }
        }
      }
    }
  }
}


local opts = {noremap=true, silent=true}
-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  -- vim.cmd [[autocmd BufWritePre * lua vim.lsp.buf.format()]]
end

local servers = { 'clangd', 'sumneko_lua', 'jsonls', 'rust_analyzer', 'pyright' }
for _, s in pairs(servers) do
     require('lspconfig')[s].setup{
         on_attach = on_attach,
         flags = { debounce_text_changes = 150 },
         opts
     }
end

local rust_tools_opts = {
    tools = {
        autoSetHints = true,
        inlay_hints =  {
            show_parameter_hints = false,
            parameter_hints_prefix = "",
            other_hints_prefix = "",
        },
    },
    server = {
        settings = {
            ["rust-analyzer"] = {
--                checkOnSave = { command = "clippy" },
            }
        }
    }
}

-- require('rust-tools').setup(rust_tools_opts)

local cmp = require'cmp'

cmp.setup({
    snippet = {
        expand = function(args) vim.fn["vsnip#anonymous"](args.body) end 
    },
    mapping = {
        ['<C-p>'] = cmp.mapping.select_prev_item(),
        ['<C-n>'] = cmp.mapping.select_next_item(),
        -- Add tab support
        ['<S-Tab>'] = cmp.mapping.select_prev_item(),
        ['<Tab>'] = cmp.mapping.select_next_item(),
        ['<C-d>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.close(),
        ['<CR>'] = cmp.mapping.confirm({
          behavior = cmp.ConfirmBehavior.Insert,
          select = true,
        })
    },
    -- Installed sources
      sources = {
        { name = 'nvim_lsp' },
        { name = 'vsnip' },
        { name = 'path' },
        { name = 'buffer' },
      },
})
EOF
