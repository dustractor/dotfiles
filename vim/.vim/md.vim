setlocal equalprg=multimarkdown

function! F_exists(fname)
    if !empty(glob(a:fname))
        if filereadable(a:fname)
            return 1
        endif
    endif
    return 0
endfunction


function! MdCompile()
    if filereadable(expand("%:p"))
        let l:twin = expand("%:p:r") . ".html"
        echom l:twin
        let l:doit = 1
        if F_exists(l:twin)
            let l:msg = printf("%s exists. Overwrite?",l:twin)
            let l:doit = confirm(l:msg,"Yes\nNo")
        endif
        if l:doit == 1
            exe printf("!echo '%s' > '%s'", '{\% extends "base.html" \%}',l:twin)
            exe printf("!echo '%s' >> '%s'", '{\% block main \%}',l:twin)
            exe printf("!multimarkdown '%s' >> '%s'",expand("%:p"),l:twin)
            exe printf("!echo '%s' >> '%s'", '{\% endblock main \%}',l:twin)
            echom "OK"
        endif
    endif
endfunction

com! MarkdownCompile call MdCompile()

nnoremap <F12> :MarkdownCompile<cr><cr>

