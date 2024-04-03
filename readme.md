# prism.vim

`prism.vim` sets colorscheme based on your working directory. This helps you
distinguish among multiple instances in the window previewer. It's similar to
[Peacock](https://marketplace.visualstudio.com/items?itemName=johnpapa.vscode-peacock)
for VSCode.

`prism.vim` chooses a colorscheme from [provided colorscheme list](#setting-colorscheme-space)
, the choice is determined by a number, which is calculated based on the current working directory.

# Screenshots

![prism](https://user-images.githubusercontent.com/1141198/57002193-3068ac00-6bf0-11e9-905c-8b6fd1f961f5.jpg)

![prism2](https://user-images.githubusercontent.com/1141198/57002194-31014280-6bf0-11e9-88d3-008bba970716.jpg)

# Installation

With [vim-plug](https://github.com/junegunn/vim-plug) or your favorite plugin manager, like

```vim
Plug 'UncleBill/prism.vim'
```

_Requires `Vim 8.0+` for full support._

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

Tired of one fixed colorscheme? You can make it shift to another every X days
automatically:

```vim
let g:prism_shift_period = 0  " disable shifting, default value
let g:prism_shift_period = 30 " every 30 days, days since 1979-1-1,
```

## Reset at runtime

You can use the `PrismSet` command to reset colorscheme at runtime. `prism.vim` will record
your chosen colorscheme (in `g:prism_config_file`, defaults to `~/.prism.vim.json`),
and will use this colorscheme for the working director in the future.

```
" use current colorscheme
:PrismSet<enter>
" select from installed colorschemes
:PrismSet <tab>
```

## cd/lcd

`prism.vim` listens to the `DirChanged` event, there are four options that can
be attached to:

>     			"window" to trigger on `:lcd`
>     			"global" to trigger on `:cd`
>     			"auto"   to trigger on 'autochdir'.
>     			"drop"	 to trigger on editing a file

_See `:h DirChanged`_

```vim
let g:prism_dir_changed_pattern = ['window', 'global']
```

Also see `:h DirChanged` for the patterns your Vim supports.

## Tabs

Enable `prism.vim` on switching tabs by:

```vim
" defaults to 0, disabled
let g:prism_count_tab = 1
```

Then `prism.vim` adds tab index to count the value for picking colorscheme, and
listens to `TabEnter`. Now switching tabs will change the colorscheme.

# License

MIT License. Copyright (c) UncleBill
