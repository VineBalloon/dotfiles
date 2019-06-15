"" vim plug

" Install if not there
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" It begins
call plug#begin('~/.vim/plugged')

" Go plugin
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

" Insert other plugs here

" It ends
call plug#end()

"" lets and sets

let mapleader = "\<space>"
let maplocalleader = "\\"

" Don't use vi please
set nocompatible

set backspace=indent,eol,start
set bg=dark
set cursorline
set history=50
set incsearch
set nojoinspaces

" This doesn't work for some fucking reason
set noswapfile

set ruler
set showcmd
set wildmenu

" Show matching brackets
set showmatch
set matchtime=2

" Best thing since sliced bread
set scrolloff=5

" May cause some rendering issues
"set lazyredraw

" Use combined relativenumber if we can
if v:version >= 740
    set number
    set relativenumber
else
    set relativenumber
endif

" Colorcolumn stuff
if exists('+cc')
    function! ToggleCc()
        if &cc ==# 0
            set cc=80
        else
            set cc=0
        endif
    endfunction

    " No cc by default
    set cc=0
    :hi ColorColumn ctermbg=green guibg=green
    nnoremap <leader>cc :call ToggleCc()<CR>
endif

if has("vms")
    set nobackup		" do not keep a backup file, use versions instead
else
    set backup		" keep a backup file
endif

if &t_Co > 2 || has("gui_running")
    syntax on
    set hlsearch
endif

if has("autocmd")
    filetype plugin indent on
    set tabstop=4
    set shiftwidth=4
    set expandtab
    set shiftround

    " Put these in an autocmd group, so that we can delete them easily.
    augroup vimrcEx
        au!

        " For all text files set 'textwidth' to 78 characters.
        autocmd FileType text setlocal textwidth=78

        " When editing a file, always jump to the last known cursor position.
        " Don't do it when the position is invalid or when inside an event handler
        " (happens when dropping a file on gvim).
        " Also don't do it when the mark is in the first line, that is the default
        " position when opening a file.
        autocmd BufReadPost *
                    \ if line("'\"") > 1 && line("'\"") <= line("$") |
                    \   exe "normal! g`\"" |
                    \ endif
    augroup END
else
    set autoindent		" always set autoindenting on
endif

"" Mappings

" Leader Mappings "

if has('terminal')
    nnoremap <leader>tt :vert term<CR>
    nnoremap <leader>T :term<CR>
endif

if exists("&foldenable")
    set foldenable
    set foldlevelstart=10
    set foldnestmax=10
    set foldmethod=indent
    nnoremap <leader>f za
endif

" Toggle local buffer's swapfile option
nnoremap <leader>sf :setlocal swapfile! \| :set swapfile?<CR>

nnoremap <leader>u guiwe
nnoremap <leader>U gUiwe

" Edit and source vimrc
nnoremap <leader>ev :vs $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

" Source vimty
nnoremap <leader>ty :source ~/.vimty.vim<cr>

nnoremap <leader>"" A"<esc>I"<esc>$
nnoremap <leader>'' A'<esc>I'<esc>$

" Other Mappings "

nnoremap <Enter> :noh<cr>

" Make Y behave as it should
map Y y$

" Never use Ex-mode
map Q gq

" Break the undo block in insert mode first with <C-G>
" So we can atomically undo insert mode deletions
inoremap <C-u> <C-G>u<C-u>
inoremap <C-w> <C-G>u<C-w>

" Select last inserted text
nnoremap gV `[v`]

nnoremap "iw viw<esc>a"<esc>bi"<esc>lel
nnoremap 'iw viw<esc>a'<esc>bi'<esc>lel

nnoremap "( %a"<esc>h%i"<esc>
nnoremap ") %a"<esc>h%i"<esc>
nnoremap '( %a'<esc>h%i'<esc>
nnoremap ') %a'<esc>h%i'<esc>

nnoremap "[ %a"<esc>h%i"<esc>
nnoremap "] %a"<esc>h%i"<esc>
nnoremap '[ %a'<esc>h%i'<esc>
nnoremap '] %a'<esc>h%i'<esc>

nnoremap "" I"<esc>$A"<esc>

vnoremap "" <esc>`>a"<esc>`<i"<esc>`>
vnoremap '' <esc>`>a'<esc>`<i'<esc>`>

" ***** ABBREVIATIONS ***** "

" Signature
iabbrev ssig -- <cr>Vincent Chen<cr>vincentchen2.033@gmail.com

" Go's infamous 'if err != nil...'
iabbrev iferr if err != nil {

