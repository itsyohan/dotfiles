let mapleader=";"

syntax on
syntax sync minlines=256
syntax enable
set synmaxcol=2048
filetype off                  " required
filetype indent on
filetype plugin on         " required

colorscheme solarized
set background=dark
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
set ttyfast    " improves smoothness of redrawing
set lazyredraw " use buffer screen updates

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



"" Vundle
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

" when running MacVim use ctrlp for fuzzy searching
" when in terminal use FZF
" FZF doesn't work with MacVim
if has("gui_running")
  Plugin 'kien/ctrlp.vim'
else
  Plugin 'junegunn/fzf.vim'
  Plugin 'junegunn/fzf'
endif

Plugin 'rking/ag.vim' " silver searcher. replaces grep
Plugin 'slim-template/vim-slim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'flazz/vim-colorschemes'
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'
Plugin 'elzr/vim-json'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'altercation/vim-colors-solarized'
Plugin 'Yggdroot/indentLine'
Plugin 'rust-lang/rust.vim'
Plugin 'elixir-lang/vim-elixir'
Plugin 'rizzatti/dash.vim'
Plugin 'jplaut/vim-arduino-ino'
Plugin 'kchmck/vim-coffee-script'
Plugin 'nathanaelkane/vim-command-w'
Plugin 'qpkorr/vim-bufkill'
Plugin 'metakirby5/codi.vim'
call vundle#end()            " required

"" airline
let g:airline#extensions#tabline#enabled = 1  " Enable the list of buffers Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'
let g:molokai_original = 1
let currentDirectory = toupper(fnamemodify(getcwd(), ':t'))
let g:airline_section_b = currentDirectory " change default git branch section to show app name

"" NerdTree
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

"" Indent Guides
let g:indentLine_color_term = 239
let g:indentLine_char = 'ː' "┆˚:˸
let g:indentLine_enabled = 1

""JSX
let g:jsx_ext_required = 0 " allow jsx in js files
au BufNewFile,BufRead *.jsx set filetype=javascript.jsx " set filetype to jsx for files with fsx extension

let g:vim_json_syntax_conceal = 0 " show quotes

"" toggle solarized light/dark
call togglebg#map("<F5>")

"" MacVim specific
if has("gui_running")
  " disable mouse hover popup, syntastic setup
  set noballooneval

  " ctrlp options
  " g:ctrlp_user_command option option conflicts with g:ctrlp_custom_ignore
  let g:ctrlp_cache_dir = $HOME . '/.cache/ctrlp'
  let g:ctrlp_user_command = 'ag %s -i --nocolor --nogroup --hidden
        \ --ignore .git
        \ --ignore .svn
        \ --ignore .hg
        \ --ignore .DS_Store
        \ --ignore "**/*.pyc"
        \ --ignore "db/migrate"
        \ -g ""'
  " use vim wildignore instead
  set wildignore+=*/node_modules/*,*/tmp/*,*/bin/*,*db/migrate/*,*/fonts/*,*app/images/*
else
  "controlP to fuzzy search
  nnoremap <C-p> :FZF<CR>
endif

