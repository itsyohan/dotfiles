let mapleader=";"
syntax on
filetype off                  " required
filetype indent on
filetype plugin on         " required

set background=dark
colorscheme solarized
set nocompatible              " be iMproved, required
set clipboard=unnamed
set modifiable
set autoread
set mouse=a
set t_Co=256
set shellpipe=>
set modelines=0
set ttyscroll=10
set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2
set nowrap
set number
set nowritebackup
set noswapfile
set nobackup
set ignorecase
set smartcase
set splitbelow
set splitright
set incsearch  " incremental searching
set ttyfast " improves smoothness of redrawing
set lazyredraw " use buffer screen updates
" if has("gui")
"set cursorline " highlight current line
" endif

nnoremap <leader>w :w<CR>
nnoremap <leader>v <C-W>v
nnoremap <leader>s <C-W>s
nnoremap <leader>r <C-R>
nnoremap <leader>h :set hlsearch!<CR>
nmap <leader>n :NERDTreeToggle<CR>

" don't jump multiple lines for a long line
nmap j gj
nmap k gk

" cycle through buffers
:nnoremap <Tab> :bnext<CR>
:nnoremap <S-TAB> :bprevious<CR>

" pane zoom
if bufwinnr(1)
  map - <C-W><C-W>
  map + <S-C-W><S-C-W>
endif

" pane navigation
nnoremap <silent> <c-j> :TmuxNavigateDown<cr>
nnoremap <silent> <c-k> :TmuxNavigateUp<cr>
nnoremap <silent> <c-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <c-l> :TmuxNavigateRight<cr>
nnoremap <silent> <c-p>p :TmuxNavigatePrevious<cr>
let g:tmux_navigator_no_mappings = 1

autocmd VimResized * :wincmd =
" zoom a vim pane, <C-w>= to re-balance
nnoremap <leader>- :wincmd _<cr>:wincmd \|<cr>
nnoremap <leader>= :wincmd =<cr>

" reload vimrc
nmap <leader>so :source $MYVIMRC<cr>

" paste on a new line
nmap <leader>p :pu<CR>


" http://stackoverflow.com/questions/4465095/vim-delete-buffer-without-losing-the-split-window
" kills current buffer without closing split screen
" command BD execute "bp|bd #"

augroup vimrcEx
  autocmd!
  " When editing a file, always jump to the last known cursor position.
  " Don't do it for commit messages, when the position is invalid, or when
  " inside an event handler (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if &ft != 'gitcommit' && line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

  " Set syntax highlighting for specific file types
  autocmd BufRead,BufNewFile Appraisals set filetype=ruby
  autocmd BufRead,BufNewFile *.md set filetype=markdown
  autocmd BufRead,BufNewFile .{jscs,jshint,eslint}rc set filetype=json

  " Enable spellchecking for Markdown
  autocmd FileType markdown setlocal spell

 " Automatically wrap at 80 characters for Markdown
  autocmd BufRead,BufNewFile *.md setlocal textwidth=80

  " Automatically wrap at 72 characters and spell check git commit messages
  autocmd FileType gitcommit setlocal textwidth=72
  autocmd FileType gitcommit setlocal spell

  " Allow stylesheets to autocomplete hyphenated words
  autocmd FileType css,scss,sass setlocal iskeyword+=-
augroup END



""""""""""
" Vundle "
""""""""""

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'mileszs/ack.vim'
Plugin 'ervandew/supertab'
Plugin 'bronson/vim-trailing-whitespace'
Plugin 'tpope/vim-sensible'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-rake'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-dispatch'
Plugin 'thoughtbot/vim-rspec'
Plugin 'scrooloose/syntastic'
Plugin 'scrooloose/nerdtree'
Plugin 'kien/ctrlp.vim'
Plugin 'rking/ag.vim'
Plugin 'kana/vim-textobj-user'
Plugin 'nelstrom/vim-textobj-rubyblock'
Plugin 'slim-template/vim-slim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'flazz/vim-colorschemes'
Plugin 'vim-ruby/vim-ruby'
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'altercation/vim-colors-solarized'
Plugin 'Yggdroot/indentLine'
Plugin 'rust-lang/rust.vim'
Plugin 'elixir-lang/vim-elixir'
Plugin 'rizzatti/dash.vim'
Plugin 'jplaut/vim-arduino-ino'
Plugin 'FelikZ/ctrlp-py-matcher'
Plugin 'kchmck/vim-coffee-script'
" Plugin 'jeffkreeftmeijer/vim-numbertoggle' huge hit on rendering performance
Plugin 'nathanaelkane/vim-command-w'
Plugin 'qpkorr/vim-bufkill'
Plugin 'metakirby5/codi.vim'
Plugin 'kristijanhusak/vim-hybrid-material'
call vundle#end()            " required
syntax enable
filetype off    " required
filetype plugin indent on


"""""""""""""" airline """"""""""""""
let g:airline#extensions#tabline#enabled = 1  " Enable the list of buffers Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'
let g:molokai_original = 1
let currentDirectory = toupper(fnamemodify(getcwd(), ':t'))
let g:airline_section_b = currentDirectory " change default git branch section to show app name
" let g:airline_section_d = currentDirectory " change default git branch section to show app name

"
"
"NerdTree
"
"

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * wincmd p
let NERDTreeHighlightCursorline=1
let NERDTreeIgnore = ['tmp', '.yardoc', 'pkg', '\.git*','\.DS_Store$']
let NERDTreeShowHidden=1
let g:NERDTreeWinSize=45
let g:NERDTreeAutoDeleteBuffer=1
let g:NERDTreeDirArrowExpandable = '✘'  "*
let g:NERDTreeDirArrowCollapsible = '✔' "|⚡
let g:NERDTreeWinSize=35
highlight NERDTreeOpenable ctermfg=Red guifg=#D33F3F " #d7d700
highlight NERDTreeClosable ctermfg=Red guifg=#D33F3F

"
"
"


autocmd StdinReadPre * let s:std_in=1
"
" autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif " open up nerdtree on boot

""""""""""""Vim Indent Guides""""""""""""""""
let g:indentLine_color_term = 239
let g:indentLine_char = 'ː' "┆˚:˸
let g:indentLine_enabled = 1

"""""""""""""JSX"""""""""""""""""""""
let g:jsx_ext_required = 0 " allow jsx in js files
au BufNewFile,BufRead *.jsx set filetype=javascript.jsx " set filetype to jsx for files with fsx extension

"""""""""vim colors colarized"""""""""
call togglebg#map("<F5>")


if has("gui_running")
  set noballooneval " disable mouse hover popup, syntastic setup
endif

" CtrlP config
let g:ctrlp_match_func = { 'match': 'pymatcher#PyMatch' } " ctrlP performance improvement
set wildignore+=*/node_modules/*,*/tmp/*,*/bin/*,*/migrate/*,*/fonts/* " ignore files

" indentLine
" let g:indentLine_conceallevel = 1 " disable concealing json quotations
"
let g:enable_bold_font = 1
