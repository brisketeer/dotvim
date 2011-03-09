" some things here taken from: http://www.robodesign.ro/files/linux/.vimrc
" some other things from mjwall.com
" some other things taken from: http://stevelosh.com/blog/2010/09/coming-home-to-vim/
"----------------------------------

" turn off vi compatibility
set nocompatible

" turn on Pathogen (plugin manager)
filetype off
call pathogen#helptags()
call pathogen#runtime_append_all_bundles()

syntax on

" turn off modelines to prevent some security exploits (http://lists.alioth.debian.org/pipermail/pkg-vim-maintainers/2007-June/004020.html)
set modelines=0

" make backspace work as usual
set backspace=indent,eol,start

" diff option: ignore whitespace
set diffopt+=iwhite

" allow changing the buffer w/o saving
set hidden

" do not place the cursor at the start of the line when using PageUp/Down
" set nostartofline

" allow cursor to be positioned where there is no actual character
set virtualedit=block

" allow specified keys that move the cursor left/right to move to the prev/next line when the cursor is on the first/last char in the line
set whichwrap=b,s,<,>

"start the visual/selection mode with using shift+arrows, etc.
set keymodel=startsel

" these set key mappings for tab editing (right, left, prev, next)
map <C-t><up> :tabr
map <C-t><down> :tabl
map <C-t><left> :tabp
map <C-t><right> :tabn

" tab settings
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab

set showmode

" show matching brackets
set showmatch
" how many tenths of a second to blink matching brackets
set mat=5

" make the tab key match bracket pairs/move between matches
nnoremap <tab> %
vnoremap <tab> %

" highlight search results
set hlsearch
" highlight the searched string, while typing
set incsearch

" show (partial) command in status line
set showcmd

" enable the ruler
set ruler

" word wrapping
"set wrap
"set textwidth=79
" show a colored column at 85 chars for reminder
"set colorcolumn=85

" always show the status line
set laststatus=2

" show the line numbers
set number

" show the relative line number (how far from current line)
"set relativenumber

" create an undo file (.un~) whenever you edit a file so you can undo after close/reopen
"set undofile

" this may be too slow:
set cursorline
"set cursorcolumn
"highlight CursorLine guibg=#f7f7f7
"highlight CursorColumn guibg=#f7f7f7

" TODO: figure out exactly what this does
filetype plugin indent on

" map help key to esc to avoid hitting by mistake
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>

