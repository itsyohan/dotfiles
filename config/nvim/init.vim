""" Plugins """

call plug#begin('~/.config/nvim/plugged')
  Plug 'Yggdroot/indentLine'
  Plug 'bronson/vim-trailing-whitespace'
  Plug 'tpope/vim-fugitive'
  Plug 'tpope/vim-surround'
  Plug 'tpope/vim-rails'
  Plug 'pangloss/vim-javascript'
  Plug 'mxw/vim-jsx'
  Plug 'elzr/vim-json'
  Plug '/usr/local/opt/fzf' " fzf location via homebrew
  Plug 'junegunn/fzf.vim'
  Plug 'scrooloose/nerdtree'
  Plug 'mileszs/ack.vim'
  Plug 'rbgrouleff/bclose.vim'
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'altercation/vim-colors-solarized'
call plug#end()


let mapleader = ";"

let $VIMRC = "~/.config/nvim/init.vim" " Set environment variable for neovim config file for easy access, shorter than $MYVIMRC

colorscheme NeoSolarized


set smartcase              " Case insensitive search when text contains all lower case, case sensitive when they're not. Needs ignorecase to be set
set ignorecase             " Case insensitive search
set wildignorecase         " Case is ignored when completing file names and directories
set background=dark        " Set background to dark
set clipboard+=unnamedplus " Yank to clipboard
set autoread               " auto reload file when it changes from outside
set showcmd                " Show (partial) command in status line.
set showmatch              " Show matching brackets.
set showmode               " Show current mode.
set ruler                  " Show the line and column numbers of the cursor.
set number                 " Show the line numbers on the left side.
set formatoptions+=o       " Continue comment marker in new lines.
set textwidth=0            " Hard-wrap long lines as you type them.
set expandtab              " Insert spaces when TAB is pressed.
set tabstop=2              " Render TABs using this many spaces.
set shiftwidth=2           " Indentation amount for < and > commands.
set noerrorbells           " No beeps.
set modeline               " Enable modeline.
set linespace=0            " Set line-spacing to minimum.
set nojoinspaces           " Prevents inserting two spaces after punctuation on a join (J)
set nostartofline          " Do not jump to first character with page commands.
set mouse=a                " Enable mouse interaction
set re=1                   " Use older regex engine, which has better performance
set nowrap                 " Do not wrap text to next line
set splitright             " Focus right pane on vertical split
set splitbelow             " Focus down pane on horizontal split

au FocusGained * :checktime

" Highlight current line number
" The following is needed to work on both gui vim and terminal vim
hi clear CursorLine
augroup CLClear
    autocmd! ColorScheme * hi clear CursorLine
augroup END

hi CursorLineNR term=bold cterm=NONE ctermfg=LightYellow ctermbg=NONE gui=NONE guifg=Yellow guibg=NONE
" hi CursorLineNR term=bold cterm=NONE ctermfg=DarkRed ctermbg=NONE gui=NONE guifg=DarkRed guibg=NONE
augroup CLNRSet
    autocmd! ColorScheme * hi CursorLineNR term=bold cterm=NONE ctermfg=LightYellow ctermbg=NONE gui=NONE guifg=Yellow guibg=NONE
augroup END


""" Key Mapping """

" --Pane navigation

" Move up
nnoremap <C-J> <C-W><C-J>

" Move down
nnoremap <C-K> <C-W><C-K>

" Move right
nnoremap <C-L> <C-W><C-L>

" Move left
nnoremap <C-H> <C-W><C-H>

" Pane navigation--


" Save file
nnoremap <leader>w :w<CR>

" Vertical split
nnoremap <leader>v <C-W>v

" Horizontal split
nnoremap <leader>s <C-W>s

" Redo
nnoremap <leader>r <C-R>

" Toggle highlight
" Use :noh over hlsearch! otherwise I have to toggle highlight to search next word
nnoremap <leader>h :noh<CR>

" Toggle line wrap
nnoremap <leader>1 :set wrap!<CR>

" Toggle current line highlight
nnoremap <leader>2 :set cursorline!<CR>

" Toggle relative line number
nnoremap <leader>3 :set relativenumber!<CR>

" Toggle solarized light/dark. Has to be called after plugin loaded
call togglebg#map("<leader>5")

" Go to next buffer
:nnoremap <Tab> :bnext<CR>

" Go to previous buffer
:nnoremap <S-TAB> :bprevious<CR>

" Control-P to fuzzy search
nnoremap <C-p> :FZF<CR>

" Don't jump multiple lines for a long line
nmap j gj
nmap k gk

" Paste on a new line
nmap <leader>p :pu<CR>

" Copy file path to clipboard
nmap cp :let @*=expand("%")<CR>

" Toggle Nerdtree
nmap <leader>n :NERDTreeToggle<CR>

" Reveal current file in Nerdtree
nmap <leader>m :NERDTreeFind<CR>

" Map :Noh to :noh. I do this way too often
cnoreabbrev Noh noh

" CTRL-w to close current buffer without killing windows, next best thing to CMD-w
nmap <C-w> :Bclose<CR>

" Open terminal buffer to the right
nnoremap <leader>t :vsplit<CR>:terminal<CR>

" Quit terminal
tnoremap <leader><Esc> <C-\><C-n>

" Replace current word under cursor with clipboard
"   ciw - delete curent word
"   <C-r>0 Paste first entry in registers aka. clipboard
map <S-p> ciw<C-r>0<ESC>

""" JSX


let g:jsx_ext_required = 0                              " Allow jsx in js files

au BufNewFile,BufRead *.jsx set filetype=javascript.jsx " Set filetype to jsx for files with fsx extension


""" Nerdtree


autocmd StdinReadPre * let s:std_in=1

autocmd VimEnter * wincmd p

let NERDTreeHighlightCursorline=1

let NERDTreeIgnore = ['tmp', '.yardoc', 'pkg', '\.git*','\.DS_Store$']

let NERDTreeShowHidden=1

let g:NERDTreeWinSize=45

let g:NERDTreeAutoDeleteBuffer=1

let g:NERDTreeDirArrowExpandable = '·'

let g:NERDTreeDirArrowCollapsible = '⌞'

let g:NERDTreeWinSize=35

highlight NERDTreeOpenable ctermfg=Red guifg=#D33F3F " #d7d700

highlight NERDTreeClosable ctermfg=Red guifg=#D33F3F



""" Airline


let g:airline#extensions#tabline#enabled = 1                  " Enable the list of buffers Show just the filename

let g:airline#extensions#tabline#fnamemod = ':t'

let g:molokai_original = 1

let g:airline_section_y = toupper(fnamemodify(getcwd(), ':t'))  " Change default git branch section to show app name


""" Indent lines


let g:indentLine_color_term = 239

let g:indentLine_char = 'ː' "┆˚:˸

let g:indentLine_enabled = 1


""" vim-json


let g:vim_json_syntax_conceal = 0          " Show quotes in json files


""" ALE


let g:ale_sign_error = '🔥'

let g:ale_sign_warning = '🤔'

" let g:ale_linters = {
" \   'ruby': [],
" \}                                         " Ignore linter errors
"

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Ack
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if executable('rg')
  let g:ackprg = 'rg --vimgrep'
endif

" Alias
command -nargs=+ Ac Ack <args>
