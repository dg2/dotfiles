syntax on
filetype indent plugin on
" set background=light
let backgroundEnv=$BACKGROUND
if backgroundEnv == 'light'
    set background=light
else
    set background=dark
endif

" Add support for Pig syntax
augroup filetypedetect
 au BufNewFile,BufRead *.pig set filetype=pig syntax=pig
augroup END

" Interpret Hive files as SQL
au BufNewFile,BufRead *.hql set filetype=sql

" Markdown
" Don't fold
set nofoldenable

execute pathogen#infect()

let mapleader = ","
let g:mapleader = ","

" Notes
let g:pad#dir = "~/Dropbox/MyNotes"

set so=7
set number

set wildmenu
" Ignore files - This is automatically picked up by CtrlP
set wildignore=*.o,*.pyc,*.DS_Store,*~,*.so,*.swp
set wildignore+=.hg,.git,.svn
set wildignore+=*/target/*  "sbt target directory
set wildignore+=*/tmp/*
set wildignore+=*.class

set ruler

set cmdheight=2

set backspace=eol,start,indent
set whichwrap+=<,>,h,l

set hlsearch
set incsearch

set lazyredraw

set magic
set noerrorbells
set t_vb=
set tm=500

set expandtab
set smarttab
set tabstop=4
set shiftwidth=4

set autochdir

" Slime
let g:slime_target = "tmux"

" Tell ctrl+p to use git ls-files on git repos
" let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
" The Silver Searcher
if executable('ag')
    " Use ag over grep
    set grepprg=ag\ --nogroup\ --nocolor
       " Use ag in CtrlP for listing files. Lightning fast and respects
       " .gitignore
         let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
     let g:ctrlp_use_caching = 0
 endif
" Jedi stuff
let g:jedi#use_tabs_not_buffers = 0
let g:jedi#use_splits_not_buffers = "left"
let g:jedi#popup_on_dot = 0

" Configure python-mode to play nice with Jedi
let g:pymode_rope = 0
let g:pymode_folding = 0

" Let supertab decide the default completion type
let g:SuperTabDefaultCompletionType = "context"

" Buffer navigation using Ctrl+Tab
let g:miniBufExplMapCTabSwitchBufs = 1 
let g:miniBufExplModSelTarget = 1

" User 256 (mostly for airline statusline)
set t_Co=256
" Colorscheme
" colorscheme slate
"set background=dark
let g:solarized_termtrans = 1
" let g:solarized_termcolors = 256
" let g:solarized_termcolors=16
" colors zenburn
" colors molokai
colorscheme solarized

" Emacs style bindings
imap <C-a> <esc>^i
imap <C-e> <esc>$A
imap <C-k> <esc>d$i
nmap <C-a> ^
nmap <C-e> $
nmap <C-k> d$

" Copy-to-clipboard shortcut for visual mode
vnoremap <C-c> "*y

" Key bindings for moving between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l
"map <C-Tab> :bnext<cr>
"map <C-S-Tab> :bprevious<cr>

nmap <leader>te :tabedit <c-r>=expand("%:p:h")<cr>

" Fast access to NERDTree
nmap <silent> <leader>t :NERDTreeToggle<CR>

" Haskell
au FileType haskell nnoremap <buffer> <silent> <leader>ht :HdevtoolsType<CR>
au FileType haskell nnoremap <buffer> <silent> <F2> :HdevtoolsClear<CR>
au FileType haskell nnoremap <buffer> <silent> <leader>hi :HdevtoolsInfo<CR>
au Bufenter *.hs compiler ghc
setlocal omnifunc=necoghc#omnifunc
"nmap <silent> <leader>ht :GhcModType<CR>
"nmap <silent> <leader>hT :GhcModTypeInsert<CR>
"nmap <silent> <leader>he :GhcModExpand<CR>
"nmap <silent> <leader>hc :GhcModCheck<CR>
"nmap <silent> <leader>hl :GhcModLint<CR>
nmap <silent> <leader>hh :Hoogle
nmap <silent> <leader>ha :HoogleInfo<CR>
let g:haddock_browser = "open"
let g:haddock_browser_callformat = "%s %s"

" Status line stuff
" Note that the status line is overridden if we use airline
set laststatus=2

" Set to 1 after installing the patched fonts
" (https://github.com/powerline/fonts) to enable
" pretty color gradients in the bar
let g:airline_powerline_fonts = 1 
" let g:airline_theme = 'airlineish'
" Automatically display all buffers when there's only one tab
" let g:airline#extensions#tabline#enabled = 1
" Don't let airline do the trailing whitespace / mixed indent analysis
let g:airline#extensions#whitespace#enabled = 0
" Configure the row / column part of the status line so that we don't show 
" percentages 
" let g:airline_section_y = '%{fugitive#statusline()}'
let g:airline_section_z = '%=%l/%L,%c'
" Syntactic
let g:syntastic_python_checkers = ['flake8', 'python']
"let g:syntastic_scala_checkers = ['scalac','fsc']
let g:syntastic_scala_checkers = ['scalac']
let g:syntastic_cpp_compiler_options = '-std=c++11'
" Ignore E501 -> Lines should be no more than 79 characters long
let g:syntastic_python_flake8_args = '--ignore=E501' 
" YouCompleteMe
let g:ycm_path_to_python_interpreter = '/usr/local/bin/python'
let g:ycm_semantic_triggers = {'haskell' : ['.']}
" Set the following to 0 to Prevent continous completion
let g:ycm_auto_trigger = 1
let g:ycm_filetype_whitelist = { 'c': 1, 'cpp': 1, 'java': 1, 'js': 1, 'scala':1, 'hs':1}
" let g:ycm_filetype_whitelist = { 'c': 1, 'cpp': 1, 'py': 1, 'java': 1, 'js': 1}

"Tagbar
let g:tagbar_ctags_bin='/usr/local/bin/ctags'
set tags=tags;/
noremap <silent> <leader>y :TagbarToggle<CR>

" Conqueterm
let g:ConqueTerm_InsertOnEnter = 1
" let g:ConqueTerm_SendVisKey = '<C-s>'

" Bind K to grep word under cursor
command -nargs=+ Ggr execute 'silent Ggrep!' <q-args> | cw | redraw!
"nnoremap <C-g> :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>
nnoremap <C-g> :Ggr! "\b<C-R><C-W>\b"<CR>:cw<CR>

" Slime
let g:slime_target = "tmux"

" Dash integration
:nmap <silent> <leader>d <Plug>DashSearch

let g:dash_map = { 'scala': ['scalaz', 'scaladoc', 'akka'] }

" EClim
nnoremap <silent> <buffer> <leader>i :JavaImport<cr>
nnoremap <silent> <buffer> <leader>d :JavaDocSearch<cr>
nnoremap <silent> <buffer> <cr> :JavaSearchContext<cr>
let g:EclimCompletionMethod = 'omnifunc'
" Remember that EClim autompletion is invoked with <C-x><C-u>

" Rust
set hidden " So that we don't need to save the file before jumping to definitions
"let g:racer_cmd = "<path-to-racer>/target/release/racer"
let $RUST_SRC_PATH="/Users/dario/opt/rust/src/"
