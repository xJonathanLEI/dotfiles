function FormatSolidity()
    let l:save_view = winsaveview()
    let buffer_lines = getline(1,'$')
    let formatted = system("forge fmt --raw -", join(buffer_lines, "\n"))
    if v:shell_error != 0
        echo formatted
    else
	let formatted_lines = split(formatted, "\n")
        let lines_count_before = len(buffer_lines)
	let lines_count_after = len(formatted_lines)

	let line_no = 1
	while line_no <= lines_count_after
            if line_no <= lines_count_before
                if formatted_lines[line_no - 1] != buffer_lines[line_no - 1]
                    call setline(line_no, formatted_lines[line_no - 1])
		endif
	    else
                call append("$", formatted_lines[line_no - 1])
	    endif
            let line_no += 1
	endwhile

        if lines_count_after < lines_count_before
	    call deletebufline("%", len(formatted_lines) + 1, "$")
	endif

        call winrestview(l:save_view)
    endif
endfunction

setlocal shiftwidth=4
command -buffer Format call FormatSolidity()
