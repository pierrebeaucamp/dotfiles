" Builds YouCompleteMe from source
function! BuildYCM(info)
    if a:info.status == 'installed' || a:info.force
        !./install.py --gocode-completer --tern-completer
    endif
endfunction

" Bundles
call plug#begin()
    Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries', 'for': 'golang' }
    Plug 'honza/vim-snippets'
    Plug 'idris-hackers/idris-vim', { 'for': 'idris' }
    Plug 'kien/ctrlp.vim'
    Plug 'SirVer/ultisnips'
    Plug 'tpope/vim-fugitive'
    Plug 'Valloric/YouCompleteMe', { 'do': function('BuildYCM') }
call plug#end()

" YouCompleteMe Settings
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_filetype_blacklist = {'unite': 1}

" Ultisnips remapping, since colliding with YCM
let g:UltiSnipsExpandTrigger = '<C-j>'
let g:UltiSnipsJumpForwardTrigger = '<C-j>'
let g:UltiSnipsJumpBackwardTrigger = '<C-k>'
