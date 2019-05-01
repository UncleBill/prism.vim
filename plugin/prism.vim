" MIT License. Copyright (c) UncleBill

if exists('g:loaded_prism') && g:loaded_prism
  finish
endif

let s:prism_config_file = get(g:, 'prism_config_file', $HOME . '/.prism.vim.json')

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

" restore from config file
function! s:PrismRestore() abort
  let l:prism_config = {}
  if filereadable(s:prism_config_file)
    let l:prism_config = json_decode(join(readfile(s:prism_config_file), ''))
  endif
  let color = get(l:prism_config, getcwd(), 0)
  if !empty(color)
    execute 'colo ' . color
    return v:true
  endif
  return v:false
endfunction


" set a colorscheme for cwd, and record it
function! s:PrismSet(wrkdir, ...) abort
  let color = a:1
  let l:prism_config = {}
  if exists(s:prism_config_file)
    let l:prism_config = json_decode(readfile(s:prism_config_file))
  endif
  let l:prism_config[a:wrkdir] = color
  execute 'colorscheme ' . color
  call writefile([json_encode(l:prism_config)], s:prism_config_file)
endfunction

command! -complete=color -nargs=1 PrismSet call s:PrismSet(getcwd(), <f-args>)

if (!s:PrismRestore())
  call Prism()
endif
augroup Prism
  autocmd!
  autocmd DirChanged global call Prism()
augroup END
