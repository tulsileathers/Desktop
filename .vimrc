" ===== Fundamentals ============
set nocompatible                " Use Vim instead of Vi
set modelines=0                 " Prevent modeline security issues
set hidden                      " Manage multiple buffers effectively
let mapleader=","               " Change leader to a comma, easier to type
filetype off                    " Vundle Require

" ===== Amenities ===============
set relativenumber	            " Relative Numbering on the side
set number                      " Precise number on the exact line
set showcmd		                  " Incomplete commands on the bottom
set showmode		                " Show current mode down the bottom
set gcr=a:blinkon0	            " Disable cursor blink
set visualbell                  " No sounds
set autoread                    " Reload files on file change outside Vim
set backspace=indent,eol,start  " Backspace behavior compatibility
set cursorline                  " Highlights current line
set ttyfast                     " Optimized speed to terminal (BS)
set ruler                       " Display ruler at the bottom
set laststatus=2                " Always displays the status line

" Make it beautiful - colors and fonts
if has("gui_running")
  "tell the term has 256 colors
  set t_Co=256

  " Show tab number (useful for Cmd-1, Cmd-2.. mapping)
  autocmd VimEnter * set guitablabel=%N:\ %t\ %M

  set lines=60
  set columns=190

  if has("gui_gtk2")
    set guifont=Inconsolata\ XL\ 12,Inconsolata\ 15,Monaco\ 12
  else
    set guifont=Inconsolata\ XL:h14,Inconsolata:h16,Monaco:h14
  end
else
  let g:CSApprox_loaded = 1

  " For people using a terminal that is not Solarized
  if exists("g:yadr_using_unsolarized_terminal")
    let g:solarized_termcolors=256
    let g:solarized_termtrans=1
  end

endif

" Disable the scrollbars (NERDTree)
set guioptions-=r
set guioptions-=L

" Disable the macvim toolbar
set guioptions-=T

" ===== Scrolling ===============
set scrolloff=8                 " Scroll when 8 lines away from margins
set sidescrolloff=15            " How near the cursor must come to the border
set sidescroll=3                " How many chars to move

" ===== Handling Files ==========
set encoding=utf-8              " UTF-8 Encoding to avoid server issues
set noswapfile                  " Avoid using Swap Files. Text is in memory
set nobackup                    " Prevent Backup files
set nowb                        " Prevent Backup files
set history=1000                " Amount of :cmdline history

" ===== Searching ===============
set ignorecase                  " Ignore search case, if all-lowercase
set smartcase                   " Follow search case, if mixed cases
set gdefault                    " Substitutions are global by default no need for /g
set incsearch                   " Find the next match as we type
set showmatch                   " Jump to the matching brace {[( when inserting one
set matchtime=3                 " Timing to jump to matching brace
set hlsearch                    " Highlight searches by default
set tags=tags                   " Set the cTags directory

" ===== Persistent Undo =========
" Keep undo history across sessions, by storing in file.
if has('persistent_undo') && !isdirectory(expand('~').'/.vim/backups')
  silent !mkdir ~/.vim/backups > /dev/null 2>&1
  set undodir=~/.vim/backups
  set undofile
endif

" ===== Indentation =============
set expandtab		                " Transform Tabs into spaces
set tabstop=2 		              " Expand Tabs to 2 spaces
set softtabstop=2	              "
set shiftwidth=2	              " Reindent Operations using << and >>
set autoindent		              " Copy indent from current line on the next line
set smartindent		              " Match braces indentation (inside blocks)
set smarttab		                "

nnoremap p p=`]<C-o>	          " Autoindent pasted text with p
nnoremap P P=`]<C-o>	          " Autoindent pasted text with P

" ===== Folds ===================

set foldmethod=indent           " Fold based on indent
set foldnestmax=9               " Deepest fold is 3 levels
set nofoldenable                " Dont fold by default

" ===== Completion ==============
set wildmenu                    " Menu at the bottom of the window Ctrl-n Ctrl-p
set wildmode=list:longest       " Recursive matching of command
set wildignore=*.o,*.obj,*~     " IGNORE FILES:
set wildignore+=*vim/backups*
set wildignore+=*sass-cache*
set wildignore+=*DS_Store*
set wildignore+=vendor/rails/**
set wildignore+=vendor/cache/**
set wildignore+=*.gem
set wildignore+=log/**
set wildignore+=tmp/**
set wildignore+=*.png,*.jpg,*.gif
set wildignore+=*/tmp/*,*.so,*.swp,*.zip
set wildignore+=_build/**

" ===== FORCE hjkl ==============
nnoremap <up> :bn<CR>
nnoremap <down> :bp<CR>
nnoremap <left> :tabp<CR>
nnoremap <right> :tabn<CR>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>
nnoremap j gj
nnoremap k gk

" ===== Move around brackets ====
nnoremap <leader><space> :noh<cr>
nnoremap <tab> %
vnoremap <tab> %

" ===== Line Wrapping ===========
set wrap
set textwidth=80
set formatoptions=qrn1
" set colorcolumn=85

" ===== Invisible Characters ====
set list
set listchars=tab:\ \ ,trail:·

" ===== VUNDLE ==================
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
" The best git wrapper of all time
Plugin 'tpope/vim-fugitive'
" A light and configurable statusline/tabline
Plugin 'itchyny/lightline.vim'
" Colortheme Solarized Black
Plugin 'altercation/vim-colors-solarized'
" Extends the matchability of the % key
Plugin 'vim-scripts/matchit.zip'
" Autocomplete brackets and whatnot
Plugin 'jiangmiao/auto-pairs'
" Autocomplete or 'Wisely End' Blocks
Plugin 'tpope/vim-endwise.git'
" Runs RSpec from within Vim
Plugin 'skwp/vim-iterm-rspec'
" A Front for ag, the_silver_searcher
Plugin 'rking/ag.vim'
" Emmet HTML Autocompletion
Plugin 'mattn/emmet-vim'
" Full path fuzzy file, buffer, mru, tag,... finder
Plugin 'ctrlpvim/ctrlp.vim'
" Mappings to easily delete, change and add blocks
Plugin 'tpope/vim-surround'
" Remaps . (dot) in a way that plugins can tap into it
Plugin 'tpope/vim-repeat'
" NERDTree Directory and Files Explorer
Plugin 'scrooloose/nerdtree'
" NERDTree Tabs
Plugin 'jistr/vim-nerdtree-tabs'
" SplitJoin code: Blocks and Tags
Plugin 'AndrewRadev/splitjoin.vim'
" Tabularize and Indent Code
Plugin 'godlygeek/tabular'
" Autocomplete Languages Syntax
Plugin 'Shougo/neocomplete.git'
" Allow Multiple Cursors and multline editing
Plugin 'kristijanhusak/vim-multiple-cursors'
" Open Remote Terminal Sessions
Plugin 'christoomey/vim-tmux-navigator'
" Refreshes the tags on file save
Plugin 'ludovicchabant/vim-gutentags'


" LANGUAGE SPECIFIC FILES HANDLED BY POLYGLOT
Plugin 'sheerun/vim-polyglot'

" RUBY ON RAILS Specific Plugins
" ******************************
" Extracting Methods and Renaming Variables
Plugin 'ecomba/vim-ruby-refactoring'
" Improved Syntax Highlighting for RSpec
Plugin 'keith/rspec.vim'
" Ruby Snippets
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'
" Easy navigation of the Rails directory structure
Plugin 'tpope/vim-rails'

" ERLANG Specific Plugins
" ***********************
Plugin 'vim-erlang/vim-erlang-compiler'
Plugin 'vim-erlang/vim-erlang-omnicomplete'
Plugin 'vim-erlang/vim-erlang-tags'

" ELIXIR / PHOENIX Specific Plugins
" *********************************
" Elixir Project's Information
Plugin 'slashmili/alchemist.vim'
let g:alchemist_tag_disable = 1
" For auto completion press <C-x><C-o> while your are in INSERT mode.
Plugin 'c-brenn/phoenix.vim'
Plugin 'tpope/vim-projectionist'

" Autocompletion Snippets
" They are installed to ~/.vim/bundle/vim-snippets/snippets
" We must make a ln -s THATDIR ~/.vim/snippets
Plugin 'honza/vim-snippets'

" All of your Plugins must be added before the following line
call vundle#end()            " required

filetype plugin indent on   " required
" ===== Bundle's Settings =========
so ~/.vim/bundle/ag.vim/plugin/ag.vim
so ~/.vim/bundle/ctrlp.vim/plugin/ctrlp.vim
so ~/.vim/bundle/lightline.vim/plugin/lightline.vim
so ~/.vim/bundle/neocomplete/plugin/neocomplete.vim
so ~/.vim/bundle/nerdtree/plugin/NERD_tree.vim
so ~/.vim/bundle/vim-surround/plugin/surround.vim
so ~/.vim/bundle/vim-fugitive/plugin/fugitive.vim
so ~/.vim/bundle/vim-iterm-rspec/plugin/iterm-rspec.vim
so ~/.vim/bundle/vim-multiple-cursors/plugin/multiple_cursors.vim
so ~/.vim/bundle/vim-rails/plugin/rails.vim
so ~/.vim/bundle/vim-ruby-refactoring/plugin/ruby-refactoring.vim

" ===== Abbreviations ===========
" so ~/.vim/bundle/abbr/plugin/abbr.vim "rlb, rld, pry!, cl!

" ===== Styling =================
syntax enable                   " Syntax highlighting
set background=dark             " Dark Background
colorscheme solarized           " Set Theme

" ===== Custom Keymaps =========
" No F1 Key, thanks
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>

" NERDTree Toggle
map <C-w> :NERDTreeToggle<CR>

" Fast trailing whitespace stripping
nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>

" Fold HTML Tags
nnoremap <leader>ft Vatzf

" Expand HTML Tags and CSS Properties with TAB (Emmet)
imap <expr> <tab> emmet#expandAbbrIntelligent("\<tab>")

" Sort CSS Properties
nnoremap <leader>S ?{<CR>jV/^\s*\}?$<CR>k:sort<CR>:noh<CR>

" Quick Escaping
inoremap jj <ESC>

" Open New Vertical Split and switch
nnoremap <leader>w <C-w>v<C-w>l
" Open New Horizontal Split and switch
nnoremap <leader>y :split<CR><C-w>j

" Easily Navigate Splits
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" One window only
nnoremap <leader>o :only<cr>

" Tabularize and align
nmap <Leader>a= :Tabularize /=<CR>
vmap <Leader>a= :Tabularize /=<CR>
nmap <Leader>a: :Tabularize /:\zs<CR>
vmap <Leader>a: :Tabularize /:\zs<CR>
nmap <C-g> :Tabularize /,\zs<CR>
vmap <C-g> :Tabularize /,\zs<CR>
nmap <Leader>a! :%g/^\s*[^#]/Tabularize /,<CR>
vmap <Leader>a! :%g/^\s*[^#]/Tabularize /,<CR>


" Make 0 go to the first character rather than the beginning
" of the line. When we're programming, we're almost always
" interested in working with text rather than empty space. If
" you want the traditional beginning of line, use ^
nnoremap 0 ^
nnoremap ^ 0

" ,# Surround a word with #{ruby interpolation}
map ,# ysiw#
vmap ,# c#{<C-R>"}<ESC>

" ERB Tags with <c-s> or Visual Block + S = or S -
let b:surround_{char2nr('=')} = "<%= \r %>"
let b:surround_{char2nr('-')} = "<% \r %>"


map ," ysiw"
vmap ," c"<C-R>""<ESC>

" ,' Surround a word with 'single quotes'
map ,' ysiw'
vmap ,' c'<C-R>"'<ESC>

" ,) or ,( Surround a word with (parens)
" The difference is in whether a space is put in
map ,( ysiw(
map ,) ysiw)
vmap ,( c( <C-R>" )<ESC>
vmap ,) c(<C-R>")<ESC>

" ,[ Surround a word with [brackets]
map ,] ysiw]
map ,[ ysiw[
vmap ,[ c[ <C-R>" ]<ESC>
vmap ,] c[<C-R>"]<ESC>

" ,{ Surround a word with {braces}
map ,} ysiw}
map ,{ ysiw{
vmap ,} c{ <C-R>" }<ESC>
vmap ,{ c{<C-R>"}<ESC>

map ,` ysiw`

" gary bernhardt's hashrocket
imap <c-l> <space>=><space>

"Go to last edit location with ,.
nnoremap ,. '.

" the first quote will autoclose so you'll get 'foo' and hitting <c-a> will
" put the cursor right after the quote
imap mmm <esc>wa

" select current line
nmap ,l 0vg_
