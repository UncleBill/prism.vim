# prism.vim

`prism.vim` sets colorscheme basing on your working directory, and helps you
distinguish a specific Vim instance among multiple ones from window previewer.
It is like [peacock](https://marketplace.visualstudio.com/items?itemName=johnpapa.vscode-peacock)
for VSCode.

`prism.vim` turns the current working directory into a certain number, with
this number, it then chooses a colorscheme from [provided colorscheme list](#setting-colorscheme-space).

# Screenshots

![prism](https://user-images.githubusercontent.com/1141198/57002193-3068ac00-6bf0-11e9-905c-8b6fd1f961f5.jpg)

![prism2](https://user-images.githubusercontent.com/1141198/57002194-31014280-6bf0-11e9-88d3-008bba970716.jpg)

# Installation

With [vim-plug](https://github.com/junegunn/vim-plug) or your favorite plugin manager, like

```vim
Plug 'UncleBill/prism.vim'
```

# Usage

## Setting colorscheme space

`Prism.vim` will pick one from colorschemes below to set up.

```viml
" defaults to ['peachpuff', 'desert', 'evening', 'murphy']
" some of below are from https://github.com/flazz/vim-colorschemes
let g:prism_colorschemes = ['atom', 'desert', 'solarized', 'badwolf', 'lightyellow',
      \ 'dracula', 'peachpuff', 'pablo', 'SlateDark', 'torte', 'blink', 'blueprint',
      \ 'Benokai', 'greens', 'grayorange', 'graywh']
```

You can get a collection of colorschemes at [flazz/vim-colorschemes](https://github.com/flazz/vim-colorschemes)

## Shifting

Tired of one fixed colorscheme? You can make it shift to another in X days
automatically:

```vim
let g:prism_shift_period = 0  " disable shifting, default value
let g:prism_shift_period = 30 " every 30 days, days from 1979-1-1,
```

## Reset at runtime

Use `PrismSet` command to reset colorscheme at runtime. `prism.vim` will record
this colorscheme (in `g:prism_config_file`, defaults to `~/.prism.vim.json`), and use it in the future, for
current working directory

```
:PrismSet<tab>
```

## cd/lcd

`prism.vim` listens to the autocmd `DirChanged`, there are four options that
you can attach:

>				"window" to trigger on `:lcd`
>				"global" to trigger on `:cd`
>				"auto"   to trigger on 'autochdir'.
>				"drop"	 to trigger on editing a file

*see `:h DirChanged`*

```vim
let g:prism_dir_changed_pattern = ['window', 'global']
```

# License

MIT License. Copyright (c) UncleBill
