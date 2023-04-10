source c:/users/nice_sprite/.config/nvim/coc_config.vim
let g:neovide_refresh_rate=144 
set guifont=jetbrains\ mono:h11
let g:neovide_cursor_animation_length=0.00
set termguicolors
set mouse=nvi

call plug#begin()
Plug 'junegunn/vim-easy-align'
" Plugin outside ~/.vim/plugged with post-update hook
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'airblade/vim-rooter' 
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" color schemes
Plug 'tanvirtin/monokai.nvim'
Plug 'NLKNguyen/papercolor-theme'
Plug 'arcticicestudio/nord-vim'
Plug 'ayu-theme/ayu-vim'
Plug 'bignimbus/pop-punk.vim'
Plug 'bluz71/vim-moonfly-colors'
Plug 'cliuj/vim-dark-meadow'
Plug 'cocopon/iceberg.vim'
Plug 'deathlyfrantic/vim-distill'
Plug 'deathlyfrantic/vim-distinguished'
Plug 'eskilop/NorthernLights.vim'
Plug 'evturn/cosmic-barf'
Plug 'folke/tokyonight.nvim'
Plug 'jacoborus/tender.vim'
Plug 'kaicataldo/material.vim', { 'branch': 'main' }
Plug 'katawful/kat.nvim'
Plug 'kyazdani42/nvim-tree.lua'
Plug 'mangeshrex/everblush.vim'
Plug 'nvim-lualine/lualine.nvim'
Plug 'sainnhe/everforest'
Plug 'tiagovla/tokyodark.nvim'
Plug 'tomasiser/vim-code-dark'
Plug 'vim-scripts/midnight2.vim'
Plug 'vim-scripts/northland.vim'


"  tpope plugins
Plug 'tpope/vim-obsession'
Plug 'tpope/vim-surround'

" Use release branch (recommend)
Plug 'neoclide/coc.nvim', {'branch': 'release'}

call plug#end()

syntax enable
filetype plugin indent on
let g:rustfmt_autosave = 1
set signcolumn=yes
let mapleader = " " 
nnoremap <leader>e :NvimTreeToggle<CR>

nnoremap <C-p> :FZF<CR>
let g:fzf_layout = {'up':'~90%', 'window': { 'width': 0.8, 'height': 0.8,'yoffset':0.5,'xoffset': 0.5, 'highlight': 'Todo', 'border': 'sharp' } }
" Customize fzf colors to match your color scheme

let $FZF_DEFAULT_OPTS = '--layout=reverse --info=inline'
" let $FZF_DEFAULT_COMMAND="rg --files --type-add batch:*.bat -tbatch -tcpp" 

let g:fzf_colors =
            \ { 'fg':      ['fg', 'Normal'],
            \ 'bg':      ['bg', 'Normal'],
            \ 'hl':      ['fg', 'Comment'],
            \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
            \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
            \ 'hl+':     ['fg', 'Statement'],
            \ 'info':    ['fg', 'PreProc'],
            \ 'border':  ['fg', 'Ignore'],
            \ 'prompt':  ['fg', 'Conditional'],
            \ 'pointer': ['fg', 'Exception'],
            \ 'marker':  ['fg', 'Keyword'],
            \ 'spinner': ['fg', 'Label'],
            \ 'header':  ['fg', 'Comment'] }

let g:netrw_banner = 0
let g:netrw_winsize=25
"let g:netrw_liststyle=3

set bg=dark
let g:material_theme_style = 'darker'
colorscheme monokai 
hi Normal ctermbg=16 guibg=#0a0a0a

set nu
set nowrap
set expandtab ts=4 sw=4 ai

set completeopt=menuone,noinsert,noselect
set shortmess+=c

lua <<EOF
require('lualine').setup()

--vim.g.tokyonight_style = "storm"
--vim.cmd[[colorscheme tokyonight]]

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
}

-- init.lua

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
    height = 30,
    hide_root_folder = false,
    side = 'left',
    auto_resize = false,
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
vim.g.nvim_tree_icons = {
    default = ''
}


EOF
