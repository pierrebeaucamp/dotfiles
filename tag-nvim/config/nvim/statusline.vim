set ruler
set showcmd

set statusline=%#identifier#
set statusline+=[%f]
set statusline+=%*

set statusline+=%#warningmsg#
set statusline+=%{&ff!='unix'?'['.&ff.']':''}
set statusline+=%*

set statusline+=%#warningmsg#
set statusline+=%{(&fenc!='utf-8'&&&fenc!='')?'['.&fenc.']':''}
set statusline+=%*

set statusline+=%h
set statusline+=%y

set statusline+=%#identifier#
set statusline+=%r
set statusline+=%*

set statusline+=%#warningmsg#
set statusline+=%m
set statusline+=%*

set statusline+=%{fugitive#statusline()}

set statusline+=%#error#
set statusline+=%{StatuslineTabWarning()}
set statusline+=%*

set statusline+=%{StatuslineTrailingSpaceWarning()}
set statusline+=%{StatuslineLongLineWarning()}

"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*

set statusline+=%#error#
set statusline+=%{&paste?'[paste]':''}
set statusline+=%*

set statusline+=%=
set statusline+=%{StatuslineCurrentHighlight()}\ \
set statusline+=%c,
set statusline+=%l/%L
set statusline+=\ %P

"return a list containing the lengths of the long lines in this buffer
function! s:LongLines()
    let threshold = (&tw ? &tw : 80)
    let spaces = repeat(" ", &ts)
    let line_lens = map(getline(1,'$'), 'len(substitute(v:val, "\\t", spaces, "g"))')
    return filter(line_lens, 'v:val > threshold')
endfunction

"find the median of the given array of numbers
function! s:Median(nums)
    let nums = sort(a:nums)
    let l = len(nums)

    if l % 2 == 1
        let i = (l-1) / 2
        return nums[i]
    endif

    return (nums[l/2] + nums[(l/2)-1]) / 2
endfunction

" returns the syntax highlight group under the cursor
function! StatuslineCurrentHighlight()
    let name = synIDattr(synID(line('.'),col('.'),1),'name')
    if name == ''
        return ''
    endif
    return '[' . name . ']'
endfunction

" Warning for long lines
function! StatuslineLongLineWarning()
    if !&modifiable
        return ''
    endif

    if !exists("b:statusline_long_line_warning")
        let b:statusline_long_line_warning = ''
        let long_line_lens = s:LongLines()

        if len(long_line_lens) > 0
            let b:statusline_long_line_warning = '[' .
                        \ '#' . len(long_line_lens) . ',' .
                        \ 'm' . s:Median(long_line_lens) . ',' .
                        \ '$' . max(long_line_lens) . ']'
        endif
    endif

    return b:statusline_long_line_warning
endfunction

" Warning for mixed indentation
function! StatuslineTabWarning()
    if !&modifiable
        return ''
    endif

    if !exists("b:statusline_tab_warning")
        let b:statusline_tab_warning = ''
        let tabs = search('^\t', 'nw') != 0

        "find spaces that arent used as alignment in the first indent column
        let spaces = search('^ \{' . &ts . ',}[^\t]', 'nw') != 0

        if tabs && spaces
            let b:statusline_tab_warning =  '[mixed-indenting]'
        elseif (spaces && !&et) || (tabs && &et)
            let b:statusline_tab_warning = '[&et]'
        endif
    endif

    return b:statusline_tab_warning
endfunction

" Warning for trailing whitespaces
function! StatuslineTrailingSpaceWarning()
    if !&modifiable
        return ''
    endif

    if !exists("b:statusline_trailing_space_warning")
        let b:statusline_trailing_space_warning = ''

        if search('\s\+$', 'nw') != 0
            let b:statusline_trailing_space_warning = '[\s]'
        endif
    endif

    return b:statusline_trailing_space_warning
endfunction
autocmd cursorhold,bufwritepost * unlet! b:statusline_trailing_space_warning

