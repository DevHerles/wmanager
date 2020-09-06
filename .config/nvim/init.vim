runtime! archlinux.vim

" Specify a directory for plugins
call plug#begin('~/.local/share/nvim/plugged')

" Auto completion for neovim
if !exists("g:gui_oni")
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
  Plug 'ervandew/supertab'
endif

" A collection of language packs for vim
" Plug 'sheerun/vim-polyglot'

" Javascript
Plug 'SirVer/ultisnips'
Plug 'ternjs/tern_for_vim'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'

" Go
Plug 'zchee/deoplete-go'
Plug 'fatih/vim-go'

" Auto Closing
" Plug 'Raimondi/delimitMate'
Plug 'jiangmiao/auto-pairs'

" Snippets
Plug 'honza/vim-snippets'

" Add git symbols to gutter
Plug 'airblade/vim-gitgutter'

" Commenter plugin
Plug 'tpope/vim-commentary'

" Neomake
Plug 'neomake/neomake'
" Plug 'dojoteef/neomake-autolint'
Plug 'benjie/neomake-local-eslint.vim'

" General utilities
Plug 'easymotion/vim-easymotion'
Plug 'tpope/vim-surround'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'godlygeek/tabular'
Plug 'tpope/vim-sleuth'
Plug 'plasticboy/vim-markdown'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'

" Netrw enhancements
Plug 'Shougo/unite.vim'
Plug 'Shougo/vimfiler.vim'

Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'ryanoasis/vim-devicons'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

" Themes
Plug 'joshdick/onedark.vim'
Plug 'KeitaNakamura/neodark.vim'
Plug 'mhartington/oceanic-next'
Plug 'tomasiser/vim-code-dark'

" git
Plug 'jreybert/vimagit'

" Initialize plugin system
call plug#end()


let mapleader = "\<Space>"

" Use system clipboard
set clipboard=unnamedplus

" Enable highlight search and smartcase
set hlsearch
set ignorecase
set smartcase

" Show max characters line
set colorcolumn=80

" Enable relative line numbers with absolute line on cursor
set relativenumber
set number

" Enable mouse support (scrolling, selection)
set mouse=a

" Enable syntax and use theme
syntax on

if has("termguicolors")
  set termguicolors
endif 
if has('nvim')
  let $NVIM_TUI_ENABLE_TRUE_COLOR = 1
endif

let g:onedark_terminal_italics = 1

colorscheme onedark

filetype plugin indent on
" show existing tab with 2 spaces width
set tabstop=2
set softtabstop=2
" when indenting with '>', use 2 spaces width
set shiftwidth=2
" On pressing tab, insert 2 spaces
set expandtab

" Unbind the cursor keys in insert, normal and visual modes.
for prefix in ['n', 'v']
  for key in ['<Up>', '<Down>', '<Left>', '<Right>']
    exe prefix . "noremap " . key . " <Nop>"
  endfor
endfor

autocmd FileType javascript let g:SuperTabDefaultCompletionType = "<c-x><c-o>"
inoremap <expr><Down>  pumvisible() ? "\<C-n>" : "\<Down>"
inoremap <expr><Up>  pumvisible() ? "\<C-p>" : "\<Up>"

" Deoplete Settings
if !exists("g:gui_oni")
  call deoplete#enable()
  call deoplete#custom#set('ultisnips', 'matchers', ['matcher_fuzzy'])
endif


" Tern
autocmd FileType javascript nnoremap <silent> <buffer> gb :TernDef<CR>

" Neomake linting
let g:neomake_javascript_enabled_makers = ['eslint']
let g:neomake_jsx_enabled_makers        = ['eslint']
let g:neomake_haskell_enabled_makers    = ['hlint']
let g:neomake_ruby_enabled_makers       = ['rubocop']
" let g:neomake_autolint_cachedir='~/.config/nvim/cache'
" let g:neomake_autolint_enabled=1
" let g:neomake_verbose = 3

" Lint on save
autocmd! BufWritePost,BufEnter * Neomake

" CtrlP Settings
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'
let g:ctrlp_working_path_mode = 0
let g:ctrlp_show_hidden = 1

" Quickly open/reload vim
nnoremap <leader>ev :split $MYVIMRC<CR>  
nnoremap <leader>sv :source $MYVIMRC<CR>  

map <F10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
\ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
\ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

" Easymotion config
nmap <leader><leader><S-s> <Plug>(easymotion-s2)

nmap <leader>g :!sh -xc 'emacs --eval "(magit-status)" -T floatme'<CR>

" Vimfiler / NERDTree
let g:vimfiler_as_default_explorer = 1
let g:vimfiler_safe_mode_by_default = 0

let NERDTreeShowHidden = 1
let g:NERDTreeQuitOnOpen = 1 
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
map <BS> :NERDTreeToggle<CR>

" Vim Devicons
" after a re-source, fix syntax matching issues (concealing brackets):
if exists('g:loaded_webdevicons')
  call webdevicons#refresh()
endif

" NERDCommenter
let g:NERDSpaceDelims = 1

if !exists("g:gui_oni")
  execute "highlight" "Normal"
    \ "guibg="   "NONE"
    \ "gui="     "NONE"
endif 

" Go
let g:go_fmt_autosave = 0
