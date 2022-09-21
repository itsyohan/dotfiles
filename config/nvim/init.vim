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
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'
  Plug 'mileszs/ack.vim'
  Plug 'rbgrouleff/bclose.vim'

  " Themes Plug 'jacoborus/tender.vim'
  Plug 'sainnhe/edge'
  Plug 'sainnhe/sonokai'
  Plug 'mhartington/oceanic-next'
  Plug 'altercation/vim-colors-solarized'

  Plug 'vim-test/vim-test'

  Plug 'kyazdani42/nvim-tree.lua' " file tree
  Plug 'kyazdani42/nvim-web-devicons' " file icons
  Plug 'romgrk/barbar.nvim' " tabline
  Plug 'neoclide/coc.nvim', {'branch': 'release'} " auto-completion
call plug#end()


let mapleader = ";"

let $RC = "~/.config/nvim/init.vim" " Set environment variable for neovim config file for easy access, shorter than $MYVIMRC

" If you have vim >=8.0 or Neovim >= 0.1.5
if (has("termguicolors"))
 set termguicolors
endif

" Theme
syntax enable
colorscheme OceanicNext


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
set re=0                   " Use older regex engine, which has better performance
set nowrap                 " Do not wrap text to next line
set splitright             " Focus right pane on vertical split
set splitbelow             " Focus down pane on horizontal split
set guifont=BitstreamVeraSansMono\ NF:h14

au FocusGained * :checktime
" " Highlight current line number

" " The following is needed to work on both gui vim and terminal vim
" hi clear CursorLine
" augroup CLClear
"     autocmd! ColorScheme * hi clear CursorLine
" augroup END
" 
" hi CursorLineNR term=bold cterm=NONE ctermfg=LightYellow ctermbg=NONE gui=NONE guifg=Yellow guibg=NONE
" " hi CursorLineNR term=bold cterm=NONE ctermfg=DarkRed ctermbg=NONE gui=NONE guifg=DarkRed guibg=NONE
" augroup CLNRSet
"     autocmd! ColorScheme * hi CursorLineNR term=bold cterm=NONE ctermfg=LightYellow ctermbg=NONE gui=NONE guifg=Yellow guibg=NONE
" augroup END
set cursorline


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

" Go to next buffer
:nnoremap <Tab> :BufferNext<CR>

" Go to previous buffer
:nnoremap <S-TAB> :BufferPrevious<CR>

" Control-P to fuzzy search
nnoremap <C-p> :FZF<CR>

" Don't jump multiple lines for a long line
nmap j gj
nmap k gk

" Paste on a new line
nmap <leader>p :pu<CR>

" Copy file path to clipboard
" https://vim.fandom.com/wiki/Get_the_name_of_the_current_file
nmap cp :let @*=expand("%")<CR>
nmap cP :let @*=expand('%:p:h')<CR>


" Toggle NvimTree
nmap <leader>n :NvimTreeFindFileToggle<CR>
nmap <leader>f :NvimTreeFindFile<CR>

" Map :Noh to :noh. I do this way too often
cnoreabbrev Noh noh

" CTRL-w to close current buffer without killing windows, next best thing to CMD-w
nmap <C-w> :Bclose<CR>

" Open terminal buffer to the right
nnoremap <leader>t :vsplit<CR>:terminal<CR>i

" Quit terminal
"   single ESC to exit terminal insert mode
"   double ESC to close terminal buffer
tnoremap <leader><Esc> <C-\><C-n>
tnoremap <leader><Esc><Esc> <C-\><C-n>:q!<CR>

nmap <silent> <leader>l :TestFile<CR>
nmap <silent> <leader>L :TestNearest<CR>

nmap <leader>gb :Git blame<CR>


" Replace current word under cursor with clipboard
"   ciw - delete curent word
"   <C-r>0 Paste first entry in registers aka. clipboard
map <S-p> ciw<C-r>0<ESC>

" Move current line up and down
" https://vim.fandom.com/wiki/Moving_lines_up_or_down
nnoremap <C-j> :m .+1<CR>==
nnoremap <C-k> :m .-2<CR>==
inoremap <C-j> <Esc>:m .+1<CR>==gi
inoremap <C-k> <Esc>:m .-2<CR>==gi
vnoremap <C-j> :m '>+1<CR>gv=gv
vnoremap <C-k> :m '<-2<CR>gv=gv

""" JSX


let g:jsx_ext_required = 0                              " Allow jsx in js files

au BufNewFile,BufRead *.jsx set filetype=javascript.jsx " Set filetype to jsx for files with fsx extension


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

" Neovide
let g:neovide_cursor_vfx_mode = "railgun"





""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Auto completion
"
" See: https://github.com/neoclide/coc.nvim#example-vim-configuration
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: There's always complete item selected by default, you may want to enable
" no select by `"suggest.noselect": true` in your configuration file.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice.
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Run the Code Lens action on the current line.
nmap <leader>cl  <Plug>(coc-codelens-action)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocActionAsync('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocActionAsync('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-test
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let test#strategy = "neovim"

" Load lua scripts
lua require('init')
