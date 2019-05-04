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

## Reset at runtime

Use `PrismSet` command to reset colorscheme at runtime. `prism.vim` will record
this colorscheme (in `g:prism_config_file`, defaults to `~/.prism.vim.json`), and use it in the future, for
current working directory

```
:PrismSet<tab>
```

# License

MIT License. Copyright (c) UncleBill
