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
  " Plug '/usr/local/opt/fzf' " fzf location via homebrew
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'
  Plug 'kyazdani42/nvim-web-devicons' " optional, for file icons
  Plug 'kyazdani42/nvim-tree.lua'
  Plug 'mileszs/ack.vim'
  Plug 'rbgrouleff/bclose.vim'
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'altercation/vim-colors-solarized'
  Plug 'neovim/nvim-lspconfig'
  Plug 'hrsh7th/cmp-nvim-lsp'
  Plug 'hrsh7th/cmp-buffer'
  Plug 'hrsh7th/cmp-path'
  Plug 'hrsh7th/cmp-cmdline'
  Plug 'hrsh7th/nvim-cmp'

  " For vsnip users.
  Plug 'hrsh7th/cmp-vsnip'
  Plug 'hrsh7th/vim-vsnip'

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

" Toggle NvimTree
nmap <leader>n :NvimTreeToggle<CR>

" Reveal current file in NvimTree
nmap <leader>m :NvimTreeFindFile<CR>

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

" Neovide
let g:neovide_cursor_vfx_mode = "railgun"


" Auto completion

set completeopt=menu,menuone,noselect

lua <<EOF
  -- Setup nvim-cmp.
  local cmp = require'cmp'

  cmp.setup({
    snippet = {
      -- REQUIRED - you must specify a snippet engine
      expand = function(args)
        vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
        -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
        -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
        -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
      end,
    },
    window = {
      -- completion = cmp.config.window.bordered(),
      -- documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
      ['<C-b>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.abort(),
      ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    }),
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = 'vsnip' }, -- For vsnip users.
      -- { name = 'luasnip' }, -- For luasnip users.
      -- { name = 'ultisnips' }, -- For ultisnips users.
      -- { name = 'snippy' }, -- For snippy users.
    }, {
      { name = 'buffer' },
    })
  })

  -- Set configuration for specific filetype.
  cmp.setup.filetype('gitcommit', {
    sources = cmp.config.sources({
      { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
    }, {
      { name = 'buffer' },
    })
  })

  -- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline('/', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
      { name = 'buffer' }
    }
  })

  -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
      { name = 'path' }
    }, {
      { name = 'cmdline' }
    })
  })

  -- Setup lspconfig.
  -- local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
  -- -- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
  -- require('lspconfig')['<YOUR_LSP_SERVER>'].setup {
  --   capabilities = capabilities
  -- }
EOF

" nvim-tree
lua <<EOF
-- setup with some options
require("nvim-tree").setup({
  sort_by = "case_sensitive",
  view = {
    adaptive_size = true,
    mappings = {
      list = {
        { key = "u", action = "dir_up" },
      },
    },
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = true,
  },
})
EOF

