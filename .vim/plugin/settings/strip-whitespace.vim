" Automatically trim trailing whitespace
function! <SID>StripTrailingWhitespaces()
    "preparation: save last search, and cursor position.
    let _s=@/
    let l = line(".")
    let c = col(".")
    "do the business:
    %s/\s\+$//e
    "restore previous search history, and cursor position
    let @/=_s
    call cursor(l, c)
endfunction
autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()
