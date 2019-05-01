" MIT License. Copyright (c) UncleBill

if exists('g:loaded_prism') && g:loaded_prism
  finish
endif

let g:loaded_prism = 1

let s:default_colorschemes = ['peachpuff', 'desert', 'evening', 'murphy']
function! Prism() abort
  let chars = getcwd()
  let list = split(chars, '\zs')
  let sum = 0
  for char in list
    let sum = sum + char2nr(char)
  endfor
  let colorschemes = get(g:, 'prism_colorschemes', s:default_colorschemes)
  let chosen = colorschemes[sum % len(colorschemes)]
  execute 'colorscheme ' . chosen
endfunction

" TODO Add command to set colorscheme and record it at runtime

call Prism()
augroup Prism
  autocmd!
  autocmd DirChanged global call Prism()
augroup END
