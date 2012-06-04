let python_highlight_all = 1

setlocal smarttab
setlocal expandtab
setlocal autoindent
setlocal smartindent
setlocal tabstop=4
setlocal shiftwidth=4
setlocal softtabstop=4
setlocal completeopt-=preview
" setlocal filetype=python.django
" setlocal omnifunc=pysmell#Complete

if has('python')
    function! WrapperComplete()
        if pumvisible()
            return "\<C-N>"
        endif
        let cursyn = synID(line('.'), col('.') - 1, 1)
        if strpart(getline('.'), 0, col('.')-1) =~ '^\s*$' || cursyn != 0
            return "\<C-N>"
        else
            return "\<C-R>=RopeCodeAssistInsertMode()\<CR>"
        endif
    endfunction
    inoremap <buffer><expr> <C-N> WrapperComplete()
    " nnoremap <silent><C-.> :RopeCodeAssist<CR>
    " nnoremap <silent>, :call RopeShowDoc()<CR>

    """"""""""""""""""""""""""""""
    " Rope Plugin
    """"""""""""""""""""""""""""""
    execute "python import ropevim"

    hi pythonSpaceError gui=NONE
endif

" autocmd BufEnter,BufRead,BufNewFile *.py set filetype+=.django
" autocmd BufWrite *.py call RemoveTrailingSpace()

