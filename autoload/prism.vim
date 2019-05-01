function! prism#Complete(arg_lead, cmd_line, cursor_pos)
	let colors = []
  for f in split(globpath(&rtp, "colors/*.vim"), "\n")
    let color = get(matchlist(f,'\([^\\\/]\+\)\.vim'), 1, '')
    if !empty(color)
      call add(colors, color)
    endif
  endfor

  if empty(a:arg_lead)
    return colors
  endif

  let pos = len(a:arg_lead) - 1
  return filter(colors, {idx, val -> val[:pos] == a:arg_lead})
endfunction
