# My NeoVim Config

- [My NeoVim Config](#my-neovim-config)
  - [Plugins](#plugins)
  - [Getting Started](#getting-started)
    - [Prerequisites](#prerequisites)
    - [Basic Installation](#basic-installation)
  - [How to use](#how-to-use)
    - [Keyboard Shortcuts](#keyboard-shortcuts)
  - [TODO LIST](#todo-list)

## Plugins

- [gruvbox-material](https://github.com/sainnhe/gruvbox-material) Basic color scheme
- [vim-polyglot](https://github.com/sheerun/vim-polyglot) A solid language pack
- [vim-commentary](https://github.com/tpope/vim-commentary) Comment stuff out
- [nerdtree](https://github.com/preservim/nerdtree) A tree explorer
- [vim-fugitive](https://github.com/tpope/vim-fugitive) A Git wrapper
- [gv.vim](https://github.com/junegunn/gv.vim) A git commit browser
- [git-messenger.vim](https://github.com/rhysd/git-messenger.vim) Git message/blame
- [auto-pairs](https://github.com/jiangmiao/auto-pairs) Insert or delete brackets, parens, quotes in pair
- [junegunn/fzf](https://github.com/junegunn/fzf) A command-line fuzzy finder
- [junegunn/fzf.vim](https://github.com/junegunn/fzf.vim) Things you can do with fzf and Vim
- [coc.nvim](https://github.com/neoclide/coc.nvim) Load extensions like VSCode and host language servers
- [coc-jedi](https://github.com/pappasam/coc-jedi) coc.nvim wrapper for [jedi-language-server](https://github.com/pappasam/jedi-language-server)

## Getting Started

### Prerequisites

- Only support Debian linux system(Ubuntu or Windows 10 WSL)
- `git` should be installed

### Basic Installation

```bash
git clone https://github.com/jl7599/config.git
cd config && bash setup.sh nvim
```

## How to use

### Keyboard Shortcuts

| Shorcut                                     | Action                                | Mode |
| ------------------------------------------- | ------------------------------------- | ---- |
| `ss`                                        | horizontal split                      | n    |
| `sv`                                        | vertical split                        | n    |
| `Ctrl` `k` `j` `h` `l`                      | move window                           | n    |
| `Ctrl` `↑` `↓` `←` `→`                      | resize window                         | n    |
| `Space` `                                   | open terminal                         | n    |
| `Space` `1` `2` `3` `4` `5` `6` `7` `8` `9` | open specified tab                    | n    |
| `te`                                        | create new tab                        | n    |
| `gcc`                                       | comment out a line                    | n    |
| `gc`                                        | comment out the selection             | v    |
| `Y`                                         | copy selection to system clipboard    | v    |
| `F3`                                        | toggle tree explorer                  | n    |
| `Space` `gs`                                | git status                            | n    |
| `Space` `gd`                                | git diff                              | n    |
| `Space` `gm`                                | git message                           | n    |
| `Space` `Space`                             | fuzzy find files at root dir          | n    |
| `Space` `b`                                 | list buffers                          | n    |
| `Ctrl` `d`                                  | delete list buffers                   | n    |
| `Space` `L`                                 | fuzzy find line in all buffers        | n    |
| `Space` `ag`                                | fuzzy find string in all root content | n    |
| `gd`                                        | go to definition                      | n    |
| `gy`                                        | go to type definition                 | n    |
| `gi`                                        | go to implementation                  | n    |
| `gr`                                        | list references                       | n    |
| `K`                                         | show document                         | n    |
| `Space` `rn`                                | rename symbol                         | n    |
| `da`                                        | show all coc diagnostics              | n    |
| `:Format`                                   | format current buffer                 | c    |
| `:Fold`                                     | fold current buffer                   | c    |

## TODO LIST

- [ ] tab/buffer status line
- [ ] Python black isort flake8
- [ ] Golang