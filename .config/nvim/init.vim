let mapleader = ";"

set incsearch           " incremental searching
"set title
colorscheme solarized
set termguicolors
set background=dark

" fix clipboard pasting issue
" https://github.com/neovim/neovim/issues/583
function! ClipboardYank()
  call system('pbcopy', @@)
endfunction

function! ClipboardPaste()
  let @@ = system('pbpaste')
endfunction

vnoremap <silent> y y:call ClipboardYank()<cr>
vnoremap <silent> d d:call ClipboardYank()<cr>
nnoremap <silent> p :call ClipboardPaste()<cr>p
""

" configs from http://nerditya.com/code/guide-to-neovim/
set showcmd             " Show (partial) command in status line.
set showmatch           " Show matching brackets.
set showmode            " Show current mode.
set ruler               " Show the line and column numbers of the cursor.
set number              " Show the line numbers on the left side.
set formatoptions+=o    " Continue comment marker in new lines.
set textwidth=0         " Hard-wrap long lines as you type them.
set expandtab           " Insert spaces when TAB is pressed.
set tabstop=2           " Render TABs using this many spaces.
set shiftwidth=2        " Indentation amount for < and > commands.
set noerrorbells        " No beeps.
set modeline            " Enable modeline.
set linespace=0         " Set line-spacing to minimum.
set nojoinspaces        " Prevents inserting two spaces after punctuation on a join (J)
set nostartofline       " Do not jump to first character with page commands.
""

" what i am used to
nnoremap <leader>w :w<CR>
nnoremap <leader>v <C-W>v
nnoremap <leader>s <C-W>s
nnoremap <leader>r <C-R>
nnoremap <leader>h :set hlsearch!<CR>
""

" cycle through buffers
:nnoremap <Tab> :bnext<CR>
:nnoremap <S-TAB> :bprevious<CR>
""

"controlP to fuzzy search
nnoremap <C-p> :FZF<CR>
""

" don't jump multiple lines for a long line
nmap j gj
nmap k gk
""

" paste on a new line
nmap <leader>p :pu<CR>
""

" pane navigation
nnoremap <silent> <c-j> :TmuxNavigateDown<cr>
nnoremap <silent> <c-k> :TmuxNavigateUp<cr>
nnoremap <silent> <c-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <c-l> :TmuxNavigateRight<cr>
nnoremap <silent> <c-p>p :TmuxNavigatePrevious<cr>
" bugfix for c-h
nnoremap <silent> <BS> :TmuxNavigateLeft<cr>
let g:tmux_navigator_no_mappings = 1
""

"JSX
let g:jsx_ext_required = 0 " allow jsx in js files
au BufNewFile,BufRead *.jsx set filetype=javascript.jsx " set filetype to jsx for files with fsx extension
""

"autocmd! BufWritePost * Neomake

" Nerdtree
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
nmap <leader>n :NERDTreeToggle<CR>
"" Nerdtree

" airline
let g:airline#extensions#tabline#enabled = 1  " Enable the list of buffers Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'
let g:molokai_original = 1
let currentDirectory = toupper(fnamemodify(getcwd(), ':t'))
let g:airline_section_b = currentDirectory " change default git branch section to show app name
"" airline

" Indent lines
let g:indentLine_color_term = 239
let g:indentLine_char = 'ː' "┆˚:˸
let g:indentLine_enabled = 1
"" Indent lines


" Plugins
call plug#begin('~/.config/nvim/plugged')
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
  Plug 'junegunn/fzf.vim'
  Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
  Plug 'rking/ag.vim'
  Plug 'christoomey/vim-tmux-navigator'
  "Plug 'neomake/neomake'
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'altercation/vim-colors-solarized'
  Plug 'Yggdroot/indentLine'
  Plug 'bronson/vim-trailing-whitespace'
  Plug 'tpope/vim-fugitive'
  Plug 'pangloss/vim-javascript'
  Plug 'mxw/vim-jsx'
call plug#end()
