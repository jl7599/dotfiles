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

| Shorcut                                     | Action                             | Mode |
| ------------------------------------------- | ---------------------------------- | ---- |
| `ss`                                        | horizontal split                   | n    |
| `sv`                                        | vertical split                     | n    |
| `Ctrl` `k` `j` `h` `l`                      | move window                        | n    |
| `Ctrl` `↑` `↓` `←` `→`                      | resize window                      | n    |
| `Space` `                                   | open terminal                      | n    |
| `Space` `1` `2` `3` `4` `5` `6` `7` `8` `9` | open specified tab                 | n    |
| `te`                                        | create new tab                     | n    |
| `gcc`                                       | comment out a line                 | n    |
| `gc`                                        | comment out the selection          | v    |
| `Y`                                         | copy selection to system clipboard | v    |
| `F3`                                        | toggle tree explorer               | n    |
| `Space` `gs`                                | git status                         | n    |
| `Space` `gd`                                | git diff                           | n    |
| `Space` `gm`                                | git message                        | n    |

## TODO LIST

- [ ] 顶部状态栏
- [ ] 模糊搜索
- [ ] Python
- [ ] Golang
