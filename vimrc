" some things here taken from: http://www.robodesign.ro/files/linux/.vimrc
" some other things from mjwall.com
" some other things taken from: http://stevelosh.com/blog/2010/09/coming-home-to-vim/
" some other things taken from: https://github.com/bronson/dotfiles/blob/master/.vimrc
"----------------------------------

" Let  Pathogen bring in all the plugins (plugin manager)
filetype on
filetype off
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

filetype plugin indent on
syntax on

" basics

set nocompatible                  " turn off vi compatibility
set showcmd                       " show partial/incomplete command in status line
set showmode                      " show current mode in the status line

set incsearch                     " highlight the searched string, while typing
set hlsearch                      " highlight search results
set nowrap                        " by default, dont wrap lines (see <leader>w)
set showmatch                     " briefly jump to matching brackets while typing
set nostartofline                 " dont jump to the start of the line as a side effect (i.e. <<)

let mapleader = "_"               " the leader char lets you expand the command set
let g:mapleader = "_"

nmap <SPACE> <SPACE>:noh<CR>      " assign <SPACE> to turn off search result matches highlighting (in normal mode)

"set number                       " show the line numbers
"set relativenumber               " show the relative line number (how far from current line)
set ruler                         " enable the ruler

set mat=5                         " how many tenths of a second to blink matching brackets

set scrolloff=3                   " # lines to keep visible before and after cursor
set sidescrolloff=7               " # columns to keep visible before and after cursor
set sidescroll=1                  " continuous horizontal scroll rather than jumpy

set laststatus=2                  " always display the status line even if only one window is visible
set updatetime=1000               " reduce updatetime so current tag in taglist is highlighted faster
set autoread                      " supress warnings when git, etc. changes files on disk
set nrformats=alpha,hex           " C-A/C-X works on dec, hex, and chars (not octal so no leading 0 ambiguity)

set wildmode=list:longest         " make cmdline tab completion similar to bash
set wildmenu                      " enable ctrl-n and ctrl-p to scroll trhough matches
set wildignore=*.0,*.obj,*-       " stuff to ignore when tab completing

set backspace=indent,eol,start    " allow backspacing over everything in insert mode (make backspace work as usual)
set history=1000                  " store lots of :cmdline history

set hidden                        " allow buffers to go into the background w/o needing to save

let g:is_posix = 1                " vim's default is archaic bourne shell, bring it up to the 90's (!)

set tags=.tags,tags;/             " search for a tags file recursively from cwd to /

set directory=~/.vim/swap,~/tmp,/var/tmp/,tmp  " store swapfiles in a single directory
"set undofile                     " create an undo file (.un~) when editing a file so you can undo after close/reopen

" tab settings
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab                     " use spaces instead of tabs
set autoindent                    " try to put the right amount of spaces at the beginning of a newline

"set colorcolumn=85               " show a colored column at 85 chars for reminder

" ruby includes ! and ? in method names
autocmd FileType ruby setlocal iskeyword+=!,?

" diff option: ignore whitespace
set diffopt+=iwhite




" fixes

" map help key to ESC to avoid hitting by mistake
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>

" allow specified keys that move the cursor left/right to move to the prev/next line when the cursor is on the first/last char in the line
set whichwrap=b,s,<,>

" make the tab key match bracket pairs/move between matches
nnoremap <tab> %
vnoremap <tab> %

" add a keybinding to toggle paste mode
nnoremap <leader>p :set paste!<CR>:set paste?<CR>

" make the quickfix window wrap no matter the setting of nowrap
au BufWinEnter * if &buftype == 'quickfix' | setl wrap | endif

" these set key mappings for tab editing (right, left, prev, next)
map <C-t><up> :tabr
map <C-t><down> :tabl
map <C-t><left> :tabp
map <C-t><right> :tabn

set cursorline                          " draw a line across the screen at the current line for visibility
"set cursorcolumn                       " draw a colored column down the screen marking the current column location of the cursor
"highlight CursorLine guibg=#f7f7f7     " hex color code for the line
"highlight CursorColumn guibg=#f7f7f7   " hex color code for the cursor column

" turn off modelines to prevent some security exploits
" (http://lists.alioth.debian.org/pipermail/pkg-vim-maintainers/2007-June/004020.html)
set modelines=0

" highlight rspec keywords properly
" modified from tpope and technicalpickles: https://gist.github.com/64635
autocmd BufRead *_spec.rb syn keyword rubyRspec describe context it specify it_should_behave_like before after setup subject highlight def link rubyRspec Function




" color schemes

" desert is too low contrast
" slate is great except comments are horrible
" adaryn is very close to the solaris/emacs I used at OpenTV
" nice: breeze, evening, navajo-night
colorscheme vividchalk




" The next section is for working with vim-update-bundles
" (https://github.com/bronson/vim-update-bundles)
" Every line that starts with '" BUNDLE:" is a command to load that bundle,
" followed by related config options

" BUNDLE: git://github.com/scrooloose/nerdtree.git
nmap <Space>d :NERDTreeToggle<cr>
nmap <Space>D :NERDTreeFind<cr>


" BUNDLE: git://github.com/scrooloose/nerdcommenter.git
" Use Control-/ to toggle comments
map <C-/> <plug>NERDCommenterToggle<CR>
" And Command-/ works on the Mac
map <D-/> <plug>NERDCommenterToggle<CR>
" And C-/ produces C-_ on most terminals
map <C-_> <plug>NERDCommenterToggle<CR>


"" BUNDLE: git://github.com/tpope/vim-surround.git
" tell surround not to break the visual s keystroke (:help vs)
"xmap S <Plug>Vsurround


"" BUNDLE: git://github.com/vim-scripts/taglist.vim.git
"nmap <Space>l :TlistToggle<cr>
"let Tlist_Use_Right_Window = 1

"" BUNDLE: git://github.com/vim-scripts/bufexplorer.zip.git
"nmap <Space>b :BufExplorer<cr>

"" BUNDLE: git://git.wincent.com/command-t.git
" ensure we compile with the system ruby if rvm is installed
"" BUNDLE-COMMAND: if which rvm >/dev/null 2>&1; then rvm system exec rake
" make; else rake make; fi
"nmap <silent> <C-Space> :CommandT<CR>
"nmap <silent> <C-@> :CommandT<CR>
" let g:CommandTCancelMap = ['<C-c>', '<Esc>', '<C-Space>', '<C-@>']
" let g:CommandTSelectPrevMap = ['<C-p>', '<C-k>', '<Up>', '<ESC>OA']
" let g:CommandTSelectNextMap = ['<C-n>', '<C-j>', '<Down>', '<ESC>OB']
"let g:CommandTMatchWindowAtTop = 1

"" BUNDLE: git://github.com/bronson/vim-closebuffer.git
" BUNDLE: git://github.com/vim-ruby/vim-ruby.git
" BUNDLE: git://github.com/tpope/vim-rails.git
" BUNDLE: git://github.com/tpope/vim-rake.git
"" BUNDLE: git://github.com/vim-scripts/a.vim.git
"" BUNDLE: git://github.com/msanders/snipmate.vim.git
"" BUNDLE: git://github.com/scrooloose/snipmate-snippets.git
"" BUNDLE: git://github.com/vim-scripts/IndexedSearch.git
" BUNDLE: git://github.com/bronson/rspec-vimbundle.git

"    text objects    :he text-objects
" TODO: rewrite ruby-block-conv to use textobj-rubyblock
"" BUNDLE: git://github.com/bronson/vim-ruby-block-conv.git
"" BUNDLE: git://github.com/kana/vim-textobj-user.git
" Ruby text objects: ar, ir
"" BUNDLE: git://github.com/nelstrom/vim-textobj-rubyblock.git
" Paramter text objects (between parens and commas): aP, iP
"" BUNDLE: git://github.com/vim-scripts/Parameter-Text-Objects.git
" indent text objects: ai, ii, (include line below) aI, iI
"   ai,ii work best for Python, aI,II work best for Ruby/C/Perl
"" BUNDLE: git://github.com/michaeljsmith/vim-indent-object.git

"" BUNDLE: git://github.com/godlygeek/tabular.git

"" BUNDLE: git://github.com/tpope/vim-endwise.git
"" BUNDLE: git://github.com/tpope/vim-repeat.git

" BUNDLE: git://github.com/tpope/vim-fugitive.git
" TODO: this prompt might cause huge delays on MacOS X
" set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P

"" BUNDLE: git://github.com/ervandew/supertab.git

"" BUNDLE: git://github.com/bronson/vim-visual-star-search.git
"" BUNDLE: git://github.com/bronson/vim-trailing-whitespace.git
"" BUNDLE: git://github.com/bronson/vim-toggle-wrap.git

"" BUNDLE: git://github.com/Raimondi/YAIFA.git
" verbosity=1 allows you to check YAIFA's results by running :messages
"let g:yaifa_verbosity = 0

"" BUNDLE: git://github.com/vim-scripts/AutoTag.git
"" BUNDLE: git://github.com/robgleeson/vim-markdown-preview.git

" Syntax Files:
" BUNDLE: git://github.com/pangloss/vim-javascript.git
" BUNDLE: git://github.com/vim-scripts/jQuery.git
"" BUNDLE: git://github.com/tsaleh/vim-shoulda.git
" BUNDLE: git://github.com/tpope/vim-git.git
" BUNDLE: git://github.com/tpope/vim-cucumber.git
" BUNDLE: git://github.com/tpope/vim-haml.git
" BUNDLE: git://github.com/tpope/vim-markdown.git
" BUNDLE: git://github.com/timcharper/textile.vim.git
"" BUNDLE: git://github.com/kchmck/vim-coffee-script.git
" BUNDLE: git://github.com/ajf/puppet-vim.git
" BUNDLE: git://github.com/bdd/vim-scala.git

" Color Schemes:
" BUNDLE: git://github.com/tpope/vim-vividchalk.git
" BUNDLE: git://github.com/wgibbs/vim-irblack.git

" TODO: apparently supertab is fixed
" TODO: BUNDLE: git://github.com/majutsushi/tagbar.git  (instead of taglist)
" TODO: BUNDLE: git://github.com/hallettj/jslint.vim.git
" TODO: BUNDLE: git://github.com/ecomba/vim-ruby-refactoring.git
" TODO: BUNDLE: git://github.com/scrooloose/syntastic.git
" TODO: BUNDLE: git://github.com/int3/vim-extradite.git
" TODO: BUNDLE: git://github.com/rson/vim-conque.git
" TODO: BUNDLE: git://github.com/astashov/vim-ruby-debugger.git
" TODO: the only decent gdb frontend looks to be pyclewn?
