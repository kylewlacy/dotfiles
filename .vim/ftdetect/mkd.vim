" markdown filetype file
au BufRead,BufNewFile *.mkd,*.markdown,*.mdwn,*.md call s:FTmkd()
function! s:FTmkd()
  set filetype=mkd
  set shiftwidth=4
  set tabstop=4
endfunction
