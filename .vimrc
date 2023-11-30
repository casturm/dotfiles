set nocompatible
set fileformat=unix
set fileformats=unix,dos,mac
try
	lang en_US
catch
endtry

" Load plugins
let g:plug_shallow = 0
call plug#begin()

" Sensible defaults
Plug 'tpope/vim-sensible'

" Status bar and prompt
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'edkolev/tmuxline.vim', { 'on': [ 'Tmuxline', 'TmuxlineSimpe' ] }
Plug 'edkolev/promptline.vim', { 'on': 'PromptlineSnapshot' }

" Fuzzy file, buffer, mru, tag, etc finder
Plug 'ctrlpvim/ctrlp.vim'

" A tree explorer plugin for vim.
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'

" Git
Plug 'tpope/vim-fugitive'
" Plug 'airblade/vim-gitgutter'

" Ack
" Plug 'mileszs/ack.vim'

" Syntax checking
" Plug 'scrooloose/syntastic'
" Plug 'mtscout6/syntastic-local-eslint.vim'
" Plug 'chr4/sslsecure.vim'

" Show trailing whitespace in red background
Plug 'bronson/vim-trailing-whitespace'

" Ruby
Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-bundler'

" JSON
Plug 'elzr/vim-json'

" Snippets
Plug 'honza/vim-snippets'

" JavaScript
Plug 'othree/yajs.vim'
Plug 'othree/es.next.syntax.vim'

" TypeScript
Plug 'leafgarland/typescript-vim'

" File type support
Plug 'rodjek/vim-puppet'
Plug 'tmux-plugins/vim-tmux'
Plug 'rstacruz/sparkup'

" Naviation
Plug 'easymotion/vim-easymotion'

" Colors
" Plug 'ap/vim-css-color'
" Plug 'altercation/vim-colors-solarized'
" Plug 'KeitaNakamura/neodark.vim'
Plug 'gmist/vim-palette'

" And the rest
Plug 'wincent/command-t', {
    \   'do': 'cd ruby/command-t/ext/command-t && ruby extconf.rb && make'
    \ }
Plug 'tomtom/tcomment_vim'
Plug 'raimondi/delimitmate'
Plug 'ervandew/supertab'
Plug 'majutsushi/tagbar'
" Plug 'tpope/vim-eunuch'

call plug#end()

" File-type
filetype on
filetype plugin on
filetype indent on
silent execute '!mkdir -p ~/.vim/backup'
set grepprg=ack\ -k
set backupdir=~/.vim/backup/
set backupskip=/tmp/*,/private/tmp/*
helptags ~/.vim/doc
set backup             " keep a backup file
set cindent
set complete=k,.,w,b,u,t,i
set cursorline         " Highlight the current line number
set directory=~/.vim/backup,/tmp " This is where the swapfiles go
set history=1000       " keep 50 lines of command line history
set undolevels=1000
set ignorecase         " Ignore the case when searching
set smartcase          " Override the 'ignorecase' option if the search pattern contains ucase
set laststatus=2       " Show status only when there are more than two windows
set lazyredraw         " Don't redraw while executing macros (good performance config)
set listchars=tab:>-,space:␣,extends:>,precedes:<
set cmdheight=2        " Helps avoiding 'hit enter' prompt
" set nofoldenable
" set foldmethod=indent
" set foldminlines=1
" set foldlevelstart=1
" autocmd FileType c setlocal foldmethod=syntax
set magic              " Use some magic in search patterns
set matchtime=2        " Show the match for n tenths of a second
set noerrorbells       " Damn error bells!
set visualbell         " Better than a beep
set expandtab
set number             " Show line numbers
set copyindent
set nostartofline      " Don't jump to start of line on pagedown
set nrformats+=alpha   " Allows CTRL-A and CTRL-X to increment/decrement letters
set pastetoggle=<F11>
set scrolloff=3        " Keep 3 lines above and below the cursor
set shiftwidth=2
set shortmess=aI       " Avoid 'Hit enter to continue' message, no intro msg
set showbreak=➦        " Show character at beginning of wrapped line
set showcmd            " Show uncompleted command
set showmatch          " Show the matching closing bracket
set showmode           " Show current edit mode
set smartindent        " Indent after { has been typed
set softtabstop=2
set splitbelow         " Create new window below current one
set splitright         " Create new window to the right of the current one
set tabstop=2
set title
set titlestring=%t%(\ %M%)%(\ (%{expand(\"%:~:.:h\")})%)%(\ %a%)
set ttyfast            " We're running on a fast terminal
" Tell vim to remember certain things when we exit
"  '10  :  marks will be remembered for up to 10 previously edited files
"  "100 :  will save up to 100 lines for each register
"  :50  :  up to 50 lines of command-line history will be remembered
"  %    :  saves and restores the buffer list
"  n... :  where to save the viminfo files
set viminfo='10,\"100,:50,%,n~/.viminfo
set nowrap             " Don't wrap long lines
set whichwrap=<,>,h,l,~,[,]   " Left/right motion line wrap
set wildmenu
" have command-line completion <Tab> (for filenames, help topics, option names)
" first list the available options and complete the longest common part, then
" have further <Tab>s cycle through the possibilities:
set wildmode=list:longest,full
set wildchar=<TAB>     " the char used for "expansion" on the command line

" normally don't automatically format `text' as it is typed, IE only do this
" with comments, at 79 characters:
set formatoptions-=t
set textwidth=79
set mouse=a

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = ","
let g:mapleader = ","

" statusbar
let g:airline_theme='distinguished'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tmuxline#enabled = 0

" Set up pretty colors
syntax enable
set background=dark
let myColorscheme = 'typofree'
if &term ==? 'xterm-256color' || &term ==? 'screen-256color-bce' || &term ==? 'screen-256color'
	set t_Co=256
	execute "colorscheme ".myColorscheme
	" let g:solarized_termtrans = 1
else
	colorscheme default
endif

set guifont=Menlo\ for\ Powerline

" Map key to toggle opt - http://vim.wikia.com/wiki/Quick_generic_option_toggling
function! MapToggle(key, opt)
  let cmd = ':set '.a:opt.'! \| set '.a:opt."?\<CR>"
  exec 'nnoremap '.a:key.' '.cmd
  exec 'inoremap '.a:key." \<C-O>".cmd
endfunction
command! -nargs=+ MapToggle call MapToggle(<f-args>)

MapToggle <F3> list
MapToggle <F5> wrap
MapToggle <F4> number

" Fast editing of the .vimrc
map <leader>e :tabedit! ~/.vimrc<cr>
" When vimrc is edited, reload it
autocmd! bufwritepost ~/.vimrc source ~/.vimrc

" Fast editing of the colorscheme
silent execute "map <leader>co :tabedit! ~/.vim/colors/".myColorscheme.".vim<cr>"
" When colorscheme is edited, reload it
autocmd! bufwritepost ~/.vim/colors/*.vim execute "colorscheme ".myColorscheme

" Fast editing of the .zshrc
map <leader>z :tabedit! ~/.zshrc<cr>

" Arrows are unvimlike

nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>

" Saving shortcuts
nmap <F2> :w<C-M>
nmap <F10> :qall<C-M>
" Fast saving
" nmap <M-s> :w!<cr>

" Make ;w work http://nvie.com/posts/how-i-boosted-my-vim/
nnoremap ; :

" Use system-wide clipboard
set clipboard+=unnamed

" Copy to clipboard
map <leader>c "+y<cr>

" Session management
" Maybe checkout http://peterodding.com/code/vim/session/
silent execute '!mkdir -p ~/.vim/sessions'
nmap SM :wa<C-M>:mksession! ~/.vim/sessions/
nmap SO :wa<C-M>:source ~/.vim/sessions/

" View management
au BufWritePost,BufLeave,WinLeave ?* mkview
au BufWritePost,BufLeave,WinLeave quickfix au!
au BufWinEnter ?* silent loadview
au BufWinEnter quickfix au!

" Delete trailing whitespace
nmap <leader>wd :%s/\s\+$//<cr>
vmap <leader>wd :s/\s\+$//<cr>

" Use Q for formatting the current paragraph (or selection)
vmap Q gq
nmap Q gqap

" Easy window navigation
" map <M-h> <C-w>h
" map <M-j> <C-w>j
" map <M-k> <C-w>k
" map <M-l> <C-w>l

" Remap VIM 0 to first non-blank character
map 0 ^

" Move a line of text using ALT+[jk] or Command+[jk] on mac
" nmap <C-k> mz:m-2<cr>`z
" nmap <C-j> mz:m+<cr>`z
" vmap <C-j> :m'>+<cr>`<my`>mzgv`yo`z
" vmap <C-k> :m'<-2<cr>`>my`<mzgv`yo`z
nmap <C-j> :m .+1<CR>==
nmap <C-k> :m .-2<CR>==
inoremap <C-j> <Esc>:m .+1<CR>==gi
inoremap <C-k> <Esc>:m .-2<CR>==gi
vmap <C-j> :m '>+1<CR>gv=gv
vmap <C-k> :m '<-2<CR>gv=gv

" Only works in GUI mode
if has("mac") || has("macunix")
	nmap <D-j> <M-j>
	nmap <D-k> <M-k>
	vmap <D-j> <M-j>
	vmap <D-k> <M-k>
endif

" Create new windows horizontal (-) and vertical (/)
map <leader>- <C-W>n
map <leader>/ :vne<cr>

" Resize splits evenly automatically
autocmd VimResized * wincmd =

" Tab configuration
map <leader>tn :tabnew<cr>
map <leader>te :tabedit
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove
map <Left> :tabprevious<cr>
map <Right> :tabnext<cr>

" Make p in Visual mode replace the selected text with the "" register.
vnoremap p <Esc>:let current_reg = @"<cr>gvdi<C-R>=current_reg<cr><Esc>

" Specify the behavior when switching between buffers
try
  set switchbuf=usetab
	set stal=2
catch
endtry

" http://cloudhead.io/2010/04/24/staying-the-hell-out-of-insert-mode/
inoremap kj <Esc>

" TAG Jumping
" Create the `tags` file (may need to install ctags)
command! MakeTags !ctags -R .

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
	set hlsearch
	map <C-\> :nohlsearch<cr>
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")
	" When editing a file, always jump to the last cursor position.
	" http://vim.wikia.com/wiki/Restore_cursor_to_file_position_in_previous_editing_session
	function! ResCur()
		if line("'\"") <= line("$")
			normal! g`"
			return 1
		endif
	endfunction

	augroup resCur
		autocmd!
		autocmd BufWinEnter * call ResCur()
	augroup END

endif " has("autocmd")

" open and close folds
" Toggle fold state between closed and opened.
"
" If there is no fold at current line, just moves forward.
" If it is present, reverse its state.
" fun! ToggleFold()
" 	if foldlevel('.') == 0
" 		normal! l
" 	else
" 		if foldclosed('.') < 0
" 			. foldclose
" 		else
" 			. foldopen
" 		endif
" 	endif
" 	" Clear status line
" 	echo
" endfun

" Map this function to Space key.
" nnoremap <space> :call ToggleFold()<cr>
" vnoremap <space> :call ToggleFold()<cr>

" have the usual indentation keystrokes still work in visual mode:
vmap <Tab> <C-T>
vmap <S-Tab> <C-D>

" Bash like keys for the command line
cnoremap <C-A> <Home>
cnoremap <C-E> <End>
"inoremap <C-K> <C-U>
cnoremap <C-P> <Up>
cnoremap <C-N> <Down>

" Cope
" Do :help cope if you are unsure what cope is. It's super useful!
map <leader>ccc :botright cope 20<cr>
map <leader>\ :ccl<cr>
map <leader>n :cn<cr>
map <leader>p :cp<cr>

" Toggles
nmap <C-n> :tabnew<CR>

" Fuzzy file, buffer, mru, tag, etc finder
let g:ctrlp_show_hidden = 1
let g:ctrlp_custom_ignore = {
			\ 'dir':  '\v[\/]\.(git|hg|svn|vim/(backup|view))$',
			\ 'file': '\v\.(zwc|exe|so|dll)$',
			\ }

" Haskell
let g:haddock_browser="/usr/bin/env lynx"

" NERDTree
" https://github.com/scrooloose/nerdtree
autocmd StdinReadPre * let s:std_in=1
" Show tree if no file was given
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" Show tree if a dir was given
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
" Close vim if NERDTree is the last open buffer
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
map <leader>nt :NERDTreeToggle<cr>
map <leader>nf :NERDTreeFind<cr>
nmap <leader>t :NERDTreeToggle<CR>
let g:NERDTreeShowHidden = 1
"let g:NERDTreeWinPos = 'right'
let g:NERDTreeChDirMode=2

" Sparkup
" let g:sparkupNextMapping = '<c-n>'
" let g:sparkupExecuteMapping = '<c-e>'

" CommandT
let g:CommandTMaxHeight = 30
noremap <leader>ct :CommandT<cr>
noremap <leader>cty :CommandTFlush<cr>

" TComment
noremap <leader>cc :TComment<cr>

" Tagbar
let g:tagbar_autofocus = 1
let g:tagbar_usearrows = 1
au BufWinEnter *.js TagbarOpenAutoClose
au BufWinEnter *.php TagbarOpenAutoClose
map <leader>tb :TagbarToggle<cr>

" SyntaxAtt
" autocmd FuncUndefined * exe 'runtime autoload/' . expand('<afile>') . '.vim'
" map -a :call SyntaxAttr()<CR>

" Remove trailing whitespace
nnoremap <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>
