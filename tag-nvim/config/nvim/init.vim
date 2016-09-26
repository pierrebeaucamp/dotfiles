silent source ~/.config/nvim/bundles.vim
silent source ~/.config/nvim/statusline.vim

" General
filetype plugin indent on
let mapleader = ","
set hidden            " hide buffers
set title             " set window title
set noswapfile
set lazyredraw

" Persistent undos
set undofile
set undolevels=1000
set undoreload=10000

" Tabs and spaces
set tabstop=4
set softtabstop=4
set shiftwidth=4
set shiftround        " round < and > to a multiple of shiftwidth
set expandtab         " insert spaces instead of tabs
set nojoinspaces      " Prevents inserting two spaces after joins (j)
set copyindent
set formatoptions+=o  " continue comment marker in new lines

" Better offsets on scrolling, etc
set scrolloff=3
set display+=lastline
set virtualedit=onemore
set nowrap
autocmd FileType markdown setlocal wrap

" Search
set ignorecase
set smartcase
set magic

" Splits
set splitbelow
set splitright

" Show tabs, spaces and EOF
set list
set listchars=tab:›\ ,trail:•,extends:#,nbsp:.

" Set Relative line numbers
set number
set relativenumber
autocmd FocusLost *   set norelativenumber
autocmd FocusGained * set relativenumber
autocmd InsertEnter * set norelativenumber
autocmd InsertLeave * set relativenumber

" Better netrw
let g:netrw_altv = 1
let g:netrw_browse_split = 4
let g:netrw_liststyle = 3
set autochdir

" Colors
set background=dark
colorscheme solarized
highlight clear LineNr
syntax on
let &colorcolumn=join(range(81,335),",")

" Key mappings
nnoremap Y y$
vnoremap < <gv          " pressing < or > doesn't exit virtual mode
vnoremap > >gv
set pastetoggle=<F12>
map <C-J> <C-W>j<C-W>_  " Easier window movement
map <C-K> <C-W>k<C-W>_
map <C-L> <C-W>l<C-W>_
map <C-H> <C-W>h<C-W>_
map <silent> <C-E> :Lexplore<CR>
command! -bang Wa wa<bang>
command! -bang WA wa<bang>
command! -bang Q q<bang>
command! -bang QA qa<bang>
command! -bang Qa qa<bang>
command! -bang -nargs=* -complete=file E e<bang> <args>
command! -bang -nargs=* -complete=file W w<bang> <args>
command! -bang -nargs=* -complete=file Wq wq<bang> <args>
command! -bang -nargs=* -complete=file WQ wq<bang> <args>

" Find next merge conflict
map <leader>fc /\v^[<\|=>]{7}( .*\|$)<CR>

" For when you forgot to sudo
cmap w!! w !sudo tee % >/dev/null

" Restore cursor to position of previous session
function! ResetCursor()
    if line("\"") <= line("$")
        silent! normal! g`"
        return 1
    endif
endfunction
autocmd BufWinEnter * call ResetCursor()

" Strip trailing whitespaces and ^M chars
function! StripTrailingWhitespaces()
    let _s=@/
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    let @/=_s
    call cursor(l, c)
endfunction
autocmd BufWritePre <buffer> call StripTrailingWhitespaces()
