# My NeoVim config

- [My NeoVim config](#my-neovim-config)
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

## Getting Started

### Prerequisites

- Ubuntu, Debian and Windows 10 WSL
- git should be installed

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

## TODO LIST

- [ ] 文件树
- [ ] 顶部和底部状态栏
- [ ] 模糊搜索
- [ ] Git
- [ ] Python
- [ ] Golang