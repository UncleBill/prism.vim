# prism.vim

Set colorscheme basing on your working directory, help your distinguish a
specific Vim instance among multiple ones from window previewer. It is like
[peacock](https://marketplace.visualstudio.com/items?itemName=johnpapa.vscode-peacock)
for VSCode.

`prism.vim` turns current working directory into a certain number, then choose
a colorscheme from provided colorscheme list.

# Screenshots

![prism](https://user-images.githubusercontent.com/1141198/57002193-3068ac00-6bf0-11e9-905c-8b6fd1f961f5.jpg)

![prism2](https://user-images.githubusercontent.com/1141198/57002194-31014280-6bf0-11e9-88d3-008bba970716.jpg)

# Installation

With [vim-plug](https://github.com/junegunn/vim-plug) or your favorite plugin manager, like

```vim
Plug 'UncleBill/prism.vim'
```

# Setting colorscheme space for prism.vim

```vim
let g:prism_colorschemes = ['atom', 'desert', 'solarized', 'badwolf', 'lightyellow',
      \ 'dracula', 'peachpuff', 'pablo', 'SlateDark', 'torte', 'blink', 'blueprint',
      \ 'Benokai', 'greens', 'grayorange', 'graywh']
```

You can find a collection of colorscheme at [flazz/vim-colorschemes](https://github.com/flazz/vim-colorschemes)

# License

MIT License. Copyright (c) UncleBill
