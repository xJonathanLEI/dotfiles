function FormatCairo()
    let l:save_view = winsaveview()
        %!cairo-format -
    call winrestview(l:save_view)
endfunction

command -buffer Format call FormatCairo()
