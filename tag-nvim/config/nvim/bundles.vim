" Bundles
call plug#begin()
    " Git in the gutter
    Plug 'airblade/vim-gitgutter'
    Plug 'neomake/neomake'
    Plug 'tpope/vim-commentary'
    Plug 'roxma/nvim-completion-manager'
    Plug 'christoomey/vim-tmux-navigator'
    Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
    Plug 'altercation/vim-colors-solarized'
    Plug 'Shougo/vimproc.vim', {'do' : 'make'}
    Plug 'junegunn/rainbow_parentheses.vim'
    Plug 'jpalardy/vim-slime'
    Plug 'vim-scripts/AutoClose'
    Plug 'docunext/closetag.vim', {'for': ['html', 'xml']}

    " Snippets
    Plug 'SirVer/ultisnips'

    " Golang
    Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }

    " Idris
    Plug 'idris-hackers/idris-vim', { 'for': 'idris' }

    " Coq
    Plug 'tounaishouta/coq.vim'

    " TypeScript
    Plug 'leafgarland/typescript-vim'
    Plug 'roxma/nvim-cm-tern',  {'do': 'npm install'}

    " Nix
    Plug 'LnL7/vim-nix'

    " Racket
    Plug 'wlangstroth/vim-racket'

    " Haskell
    Plug 'dag/vim2hs'

    " Latex
    Plug 'lervag/vimtex'
call plug#end()

" Vim-go
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_fields = 1
let g:go_highlight_types = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_fmt_command = "goimports"

" Completion manager
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <buffer> <CR> (pumvisible() ? "\<c-y>\<cr>" : "\<CR>")

" Ultisnip
let g:UltiSnipsExpandTrigger            = "<Plug>(ultisnips_expand)"
let g:UltiSnipsJumpForwardTrigger       = "<Plug>(ultisnips_expand)"
let g:UltiSnipsJumpBackwardTrigger      = "<Plug>(ultisnips_backward)"
let g:UltiSnipsListSnippets             = "<Plug>(ultisnips_list)"
let g:UltiSnipsRemoveSelectModeMappings = 0
vnoremap <expr> <Plug>(ultisnip_expand_or_jump_result) g:ulti_expand_or_jump_res?'':"\<Tab>"
inoremap <expr> <Plug>(ultisnip_expand_or_jump_result) g:ulti_expand_or_jump_res?'':"\<Tab>"
imap <silent> <expr> <Tab> (pumvisible() ? "\<C-n>" : "\<C-r>=UltiSnips#ExpandSnippetOrJump()\<cr>\<Plug>(ultisnip_expand_or_jump_result)")
xmap <Tab> <Plug>(ultisnips_expand)
smap <Tab> <Plug>(ultisnips_expand)
vnoremap <expr> <Plug>(ultisnips_backwards_result) g:ulti_jump_backwards_res?'':"\<S-Tab>"
inoremap <expr> <Plug>(ultisnips_backwards_result) g:ulti_jump_backwards_res?'':"\<S-Tab>"
imap <silent> <expr> <S-Tab> (pumvisible() ? "\<C-p>" : "\<C-r>=UltiSnips#JumpBackwards()\<cr>\<Plug>(ultisnips_backwards_result)")
xmap <S-Tab> <Plug>(ultisnips_backward)
smap <S-Tab> <Plug>(ultisnips_backward)
inoremap <silent> <c-u> <c-r>=cm#sources#ultisnips#trigger_or_popup("\<Plug>(ultisnips_expand)")<cr>

" Racket (Slime)
let g:slime_target = "tmux"
autocmd VimEnter * RainbowParentheses

" Neomake
let g:neomake_javascript_eslint_maker = {
    \ 'args': ['-f', 'compact', '--fix'],
    \ 'errorformat': '%E%f: line %l\, col %c\, Error - %m,' .
    \ '%W%f: line %l\, col %c\, Warning - %m'
    \ }

let g:neomake_typescript_tslint_maker = {
    \ 'args': ['%:p', '--format verbose', '--fix'],
    \ 'errorformat': '%E%f:[%l, %c]: %m'
    \ }

function! s:Neomake_callback(options)
    edit
endfunction
autocmd BufWritePost * call neomake#Make(1, [], function('s:Neomake_callback'))
