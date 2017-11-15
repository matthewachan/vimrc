" All system-wide defaults are set in $VIMRUNTIME/debian.vim and sourced by
" the call to :runtime you can find below.  If you wish to change any of those
" settings, you should do it in this file (/etc/vim/vimrc), since debian.vim
" will be overwritten everytime an upgrade of the vim packages is performed.
" It is recommended to make changes after sourcing debian.vim since it alters
" the value of the 'compatible' option.

" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages available in Debian.
runtime! debian.vim

" Uncomment the next line to make Vim more Vi-compatible
" NOTE: debian.vim sets 'nocompatible'.  Setting 'compatible' changes numerous
" options, so any other options should be set AFTER setting 'compatible'.
"set compatible

" Vim5 and later versions support syntax highlighting. Uncommenting the next
" line enables syntax highlighting by default.
" if has("syntax")
  syntax on
" endif

" If using a dark background within the editing area and syntax highlighting
" turn on this option as well
set background=dark

" Uncomment the following to have Vim jump to the last position when
" reopening a file
"if has("autocmd")
"  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
"endif

" Uncomment the following to have Vim load indentation rules and plugins
" according to the detected filetype.
if has("autocmd")
  filetype plugin indent on
endif

" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.
set showcmd		" Show (partial) command in status line.
set showmatch		" Show matching brackets.
set ignorecase		" Do case insensitive matching
set smartcase		" Do smart case matching
set incsearch		" Incremental search
set autowrite		" Automatically save before commands like :next and :make
set hidden		" Hide buffers when they are abandoned
set mouse=a		" Enable mouse usage (all modes)

" Auto indentation on read/write
filetype indent on
set smartindent
autocmd BufRead,BufWritePre *.sh normal gg=G

" Set swap file directory
set directory^=$HOME/.vim/temp//

" Window splitting config
set splitbelow
set splitright

" Source a global configuration file if available
if filereadable("/etc/vim/vimrc.local")
  source /etc/vim/vimrc.local
endif

" Custom settings
set number
set ruler

set tabstop=4
set softtabstop=4
set expandtab

set hlsearch
set nocompatible

" filetype off
" filetype plugin indent on
set autoindent

set encoding=utf-8
set shiftwidth=2
set noshiftround
set wrap

set showmode
set showcmd

set laststatus=2

" Key mapping
nnoremap <F2> :NERDTreeToggle<CR> 
nnoremap <F3> :GitGutterToggle<CR>

set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'tpope/vim-surround' " Easily work with surrounding parens, quotes, etc.
Plugin 'tpope/vim-fugitive' " Git wrapper
Plugin 'tpope/vim-commentary' " Comment out lines easily
Plugin 'vim-syntastic/syntastic'
Plugin 'airblade/vim-gitgutter'
Plugin 'pangloss/vim-javascript'

call vundle#end()

" Color scheme
colorscheme solarized
let g:solarized_termcolors=256
let g:solarized_termtrans=0
let g:airline_theme='angr'

"Airline settings
let g:airline_powerline_fonts=1
" let g:airline_right_sep = '<'
" let g:airline_left_sep = '>'

" Recommended Syntastic settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" GitGutter settings
set updatetime=250
let g:gitgutter_highlight_lines=1

" vim-javascript settings
let g:javascript_plugin_jsdoc = 1
