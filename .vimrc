" some gems taken from https://bitbucket.org/sjl/dotfiles

set nocompatible
syntax on

filetype off
call pathogen#infect()
call pathogen#helptags()
filetype plugin indent on

set modelines=0
set encoding=utf-8
set autoindent
set nosmartindent
set history=10000
set number
set background=dark
set hidden
set backspace=indent,eol,start
set textwidth=0

set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab

map , \
let mapleader = ","

" automatically start nerdtree
"au VimEnter *  NERDTree


" search
"nnoremap / /\v
"vnoremap / /\v
set ignorecase
set smartcase
set incsearch
set showmatch
set hlsearch


noremap <silent> <leader><space> :noh<cr>:call clearmatches()<cr>

"Rename highlighted text
noremap R :%s///gc<left><left><left>

"rename word in middle
noremap ,R "hyb"iyw:%s/<C-r>i/<C-r>h/gc<left><left><left>

"rename selected text in visual mode
vnoremap R "hy:%s/<C-r>h//gc<left><left><left>

"reformats page and go to last edit location
map <Leader>cf gg=Gg;
map <Leader>vl :wa<CR>:VimuxRunLastCommand<CR>

"syntastic
let g:syntastic_javascript_checkers = ['jshint']

let g:projectionist_heuristics = {
      \ "project.clj" : {
      \ "src/*.clj": {"alternate": "test/{}_test.clj",
      \               "type": "src",
      \               "start": "`lein test-refresh`"},
      \ "test/*_test.clj": {"alternate": "src/{}.clj",
      \                     "type": "test"}
      \ },
      \ "Gemfile" : {
      \ "lib/*.rb": {"alternate": "spec/{}_spec.rb",
      \               "type": "src"
      \               },
      \ "spec/*_spec.rb": {"alternate": "lib/{}.rb",
      \                     "type": "test"}
      \ }
      \ }

"clojure
let g:rbpt_max = 16
let g:rbpt_loadcmd_toggle = 0
let g:rbpt_colorpairs = [
    \ ['brown',       'RoyalBlue3'],
    \ ['Darkblue',    'SeaGreen3'],
    \ ['darkgray',    'DarkOrchid3'],
    \ ['darkgreen',   'firebrick3'],
    \ ['darkcyan',    'RoyalBlue3'],
    \ ['darkred',     'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['brown',       'firebrick3'],
    \ ['gray',        'RoyalBlue3'],
    \ ['black',       'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['Darkblue',    'firebrick3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['darkred',     'DarkOrchid3'],
    \ ['red',         'firebrick3'],
    \ ]

let g:clojure_fuzzy_indent = 1
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

let g:clojure_fuzzy_indent_patterns = ['^facts', '^fact', '^let']

" use ,F to jump to tag in a vertical split
nnoremap <silent> ,F :let word=expand("<cword>")<CR>:vsp<CR>:wincmd w<cr>:exec("tag ". word)<cr>")"

"switch vim windows without using C-W first
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

"Control P Settings
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git\|tmp'

set cursorline
set wrap
set noswapfile
set bs=2

if &t_Co == 256
  colorscheme Tomorrow-Night
  set t_ut=
endif

" highlight trailing whitespace
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd BufRead,InsertLeave * match ExtraWhitespace /\s\+$/

" set up highlight group & retain through colorscheme changes
highlight ExtraWhitespace ctermbg=red guibg=red
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
map <silent> <LocalLeader>ws :highlight clear ExtraWhitespace<CR>

" highlight too-long lines
"autocmd BufRead,InsertEnter,InsertLeave * 2match LineLengthError /\%126v.*/
"highlight LineLengthError ctermbg=black guibg=black
"autocmd ColorScheme * highlight LineLengthError ctermbg=black guibg=black

" set quickfix window to appear after grep invocation
autocmd QuickFixCmdPost *grep* cwindow

set laststatus=2
set undodir=~/.vim/undodir
set undofile
set undolevels=1000 "maximum number of changes that can be undone
set undoreload=10000 "maximum number lines to save for undo on a buffer reload

map <silent> <LocalLeader>nt :NERDTreeToggle<CR>
let g:NERDTreeWinSize = 30
map <silent> <LocalLeader>nr :NERDTree<CR>
map <silent> <LocalLeader>nf :NERDTreeFind<CR>
let NERDTreeShowHidden=1

" If the current buffer has never been saved, it will have no name,
" call the file browser to save it, otherwise just save it.
command! -nargs=0 -bar SaveFile if &modified
      \|    if empty(bufname('%'))
        \|        browse confirm write
        \|    else
          \|        confirm write
          \|    endif
          \|endif

nnoremap <silent> <C-s> :<C-u>SaveFile<CR>
inoremap <c-s> <Esc><Esc>:SaveFile<CR><Esc>
"inoremap <c-s> <c-o>:SaveFile<CR><Esc>
vmap <C-s> <esc>:w<CR>gv

"quit if file has been written to
nnoremap <silent> <C-q> :q<CR>

"exit quickfix list
nnoremap Q :ccl<CR>

"ultisnips
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsEditSplit="vertical"

"git shortcuts
map <silent> <LocalLeader>gg :Ggrep <C-R><C-W><CR>

" copy and paste to Mac OS X clipboard
noremap <leader>p :set paste<CR>"*p<CR>:set nopaste<CR>
noremap <leader>P :set paste<CR>"*p<CR>:set nopaste<CR>
vnoremap <leader>y "*ygv
noremap <leader>y "*y

" capital Y acts like C, D
noremap Y y$

" move to beginning/end of line
nnoremap B ^
nnoremap E $

" window width
set winwidth=90
set winminwidth=15

" no arrow keys in normal and insert modes
"nnoremap <up> <nop>
"nnoremap <down> <nop>
"nnoremap <left> <nop>
"nnoremap <right> <nop>
"inoremap <up> <nop>
"inoremap <down> <nop>
"inoremap <left> <nop>
"inoremap <right> <nop>
"vnoremap <up> <nop>
"vnoremap <down> <nop>
"vnoremap <left> <nop>
"vnoremap <right> <nop>
noremap j gj
noremap k gk
noremap gj j
noremap gk k
"
"nnoremap h <nop>
"nnoremap j <nop>
"nnoremap k <nop>
"nnoremap l <nop>

nnoremap <Leader>r <nop>

" clean trailing whitespace
nnoremap <leader>w mz:%s/\s\+$//<cr>:let @/=''<cr>`z

" Emacs bindings in command line mode
"cnoremap <c-a> <home>
"cnoremap <c-e> <end>

" keep the cursor in place while joining lines
"nnoremap J mzJ`z

" disable help
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>
