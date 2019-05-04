" MIT License. Copyright (c) UncleBill

if exists('g:loaded_prism') && g:loaded_prism
  finish
endif

let s:config_file = get(g:, 'prism_config_file', $HOME . '/.prism.vim.json')
let s:shift_period = get(g:, 'prism_shift_period', 30)

let g:loaded_prism = 1
let s:days = localtime() / 3600 " days from 1979-1-1


let s:default_colorschemes = ['peachpuff', 'desert', 'evening', 'murphy']
function! Prism() abort
  if s:PrismRestore()
    return
  endif
  let chars = getcwd()
  let list = split(chars, '\zs')
  let sum = s:shift_period > 0 ? (s:days / s:shift_period) : 0
  for char in list
    let sum = sum + char2nr(char)
  endfor
  let colorschemes = get(g:, 'prism_colorschemes', s:default_colorschemes)
  let chosen = colorschemes[sum % len(colorschemes)]
  execute 'colorscheme ' . chosen
endfunction

function! s:getConfig() abort
  let l:config = {}
  if filereadable(s:config_file)
    let l:config = json_decode(join(readfile(s:config_file), ''))
  endif
  return l:config
endfunction

" restore from config file
function! s:PrismRestore() abort
  let l:prism_config = s:getConfig()
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
  let l:prism_config = s:getConfig()
  let l:prism_config[a:wrkdir] = color
  execute 'colorscheme ' . color
  call writefile([json_encode(l:prism_config)], s:config_file)
endfunction

command! -complete=color -nargs=1 PrismSet call s:PrismSet(getcwd(), <f-args>)

call Prism()
augroup Prism
  autocmd!
  autocmd DirChanged global call Prism()
augroup END
