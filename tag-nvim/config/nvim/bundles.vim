" Builds YouCompleteMe from source
function! BuildYCM(info)
    if a:info.status == 'installed' || a:info.force
        !./install.py --gocode-completer --tern-completer
    endif
endfunction

" Bundles
call plug#begin()
    " General
    Plug 'airblade/vim-gitgutter'
    Plug 'honza/vim-snippets'
    Plug 'kien/ctrlp.vim'
    Plug 'neomake/neomake'
    Plug 'SirVer/ultisnips'
    Plug 'tpope/vim-commentary'
    Plug 'tpope/vim-fugitive'
    Plug 'Valloric/YouCompleteMe', { 'do': function('BuildYCM') }
    Plug 'vim-scripts/AutoClose'

    " Theme
    Plug 'altercation/vim-colors-solarized'

    " Golang
    Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }

    " Idris
    Plug 'idris-hackers/idris-vim', { 'for': 'idris' }

    " Angular
    Plug 'matthewsimo/angular-vim-snippets'

    " Pug / Jade
    Plug 'digitaltoad/vim-pug'
call plug#end()

" YouCompleteMe Settings
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_filetype_blacklist = {'unite': 1}

" Ultisnips remapping, since colliding with YCM
let g:UltiSnipsExpandTrigger = '<C-j>'
let g:UltiSnipsJumpForwardTrigger = '<C-j>'
let g:UltiSnipsJumpBackwardTrigger = '<C-k>'

" Neomake
let g:neomake_javascript_eslint_maker = {
    \ 'args': ['-f', 'compact', '--fix', '-c', '~/.eslintrc'],
    \ 'errorformat': '%E%f: line %l\, col %c\, Error - %m,' .
    \ '%W%f: line %l\, col %c\, Warning - %m'
    \ }

function! s:Neomake_callback(options)
    if &ft == 'javascript'
        edit
    endif
endfunction
autocmd BufWritePost * call neomake#Make(1, [], function('s:Neomake_callback'))
