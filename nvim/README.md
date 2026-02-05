# My NeoVim Config

- [My NeoVim Config](#my-neovim-config)
  - [Plugins](#plugins)
    - [Core](#core)
    - [UI \& Appearance](#ui--appearance)
    - [File Explorer \& Navigation](#file-explorer--navigation)
    - [Git Integration](#git-integration)
    - [Language Support \& LSP](#language-support--lsp)
    - [Formatting \& Linting](#formatting--linting)
    - [Editor Enhancement](#editor-enhancement)
  - [Getting Started](#getting-started)
    - [Prerequisites](#prerequisites)
    - [Basic Installation](#basic-installation)
  - [How to use](#how-to-use)
    - [Keyboard Shortcuts](#keyboard-shortcuts)
      - [Window \& Tab Management](#window--tab-management)
      - [File Explorer](#file-explorer)
      - [Fuzzy Finding (Telescope)](#fuzzy-finding-telescope)
      - [Fuzzy Finding (FZF)](#fuzzy-finding-fzf)
      - [Buffer Management](#buffer-management)
      - [Git Operations](#git-operations)
      - [LSP \& Code Intelligence (CoC)](#lsp--code-intelligence-coc)
      - [Terminal](#terminal)
      - [Editor Utilities](#editor-utilities)
      - [OpenCode (AI Assistant)](#opencode-ai-assistant)
      - [Commands](#commands)


## Plugins

### Core
- [lazy.nvim](https://github.com/folke/lazy.nvim) Modern plugin manager for Neovim

### UI & Appearance
- [gruvbox-material](https://github.com/sainnhe/gruvbox-material) Warm and comfortable color scheme
- [lualine.nvim](https://github.com/nvim-lualine/lualine.nvim) Blazing fast statusline
- [bufferline.nvim](https://github.com/akinsho/bufferline.nvim) Buffer/tab management with style
- [nvim-web-devicons](https://github.com/nvim-tree/nvim-web-devicons) File icons support

### File Explorer & Navigation
- [neo-tree.nvim](https://github.com/nvim-neo-tree/neo-tree.nvim) Modern file explorer
- [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim) Highly extendable fuzzy finder
- [fzf-lua](https://github.com/ibhagwan/fzf-lua) Fast fuzzy finder integration

### Git Integration
- [gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim) Git decorations and integration

### Language Support & LSP
- [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig) Official LSP configurations
- [coc.nvim](https://github.com/neoclide/coc.nvim) IntelliSense engine with LSP support
- [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) Syntax highlighting and code understanding
- [nvim-treesitter-context](https://github.com/nvim-treesitter/nvim-treesitter-context) Show code context

### Formatting & Linting
- [conform.nvim](https://github.com/stevearc/conform.nvim) Lightweight formatting engine
- [nvim-lint](https://github.com/mfussenegger/nvim-lint) Asynchronous linter integration

### Editor Enhancement
- [nvim-autopairs](https://github.com/windwp/nvim-autopairs) Auto close brackets, quotes
- [toggleterm.nvim](https://github.com/akinsho/toggleterm.nvim) Terminal management
- [vim-tmux-navigator](https://github.com/christoomey/vim-tmux-navigator) Seamless tmux/vim navigation
- [vim-snippets](https://github.com/honza/vim-snippets) Snippet collection

## Getting Started

### Prerequisites

- Neovim >= 0.9.0
- Git
- [Nerd Font](https://www.nerdfonts.com/) (recommended for icons)
- Node.js and yarn (for coc.nvim)
- ripgrep (for telescope live grep)

### Basic Installation

```bash
git clone https://github.com/jl7599/config.git
cd config && bash setup.sh nvim
```

Or manual installation:

```bash
git clone https://github.com/jl7599/config.git ~/.config/nvim
nvim
```

Lazy.nvim will automatically install all plugins on first launch.

## How to use

### Keyboard Shortcuts

#### Window & Tab Management
| Shortcut               | Action               | Mode |
| ---------------------- | -------------------- | ---- |
| `sh`                   | horizontal split     | n    |
| `sv`                   | vertical split       | n    |
| `Ctrl` `h` `j` `k` `l` | move between windows | n    |
| `te`                   | create new tab       | n    |
| `Space` `w`            | close current buffer | n    |

#### File Explorer
| Shortcut    | Action                         | Mode |
| ----------- | ------------------------------ | ---- |
| `F3`        | toggle NeoTree                 | n    |
| `Space` `l` | reveal current file in NeoTree | n    |

#### Fuzzy Finding (Telescope)
| Shortcut        | Action                   | Mode |
| --------------- | ------------------------ | ---- |
| `Space` `Space` | find files               | n    |
| `Space` `b`     | list buffers             | n    |
| `Space` `fg`    | live grep                | n    |
| `Space` `fh`    | help tags                | n    |
| `Space` `of`    | old files                | n    |
| `Space` `ag`    | grep string under cursor | n    |

#### Fuzzy Finding (FZF)
| Shortcut   | Action                  | Mode |
| ---------- | ----------------------- | ---- |
| `Ctrl` `f` | fuzzy search in files   | n    |
| `Ctrl` `f` | search visual selection | x    |

#### Buffer Management
| Shortcut | Action                | Mode |
| -------- | --------------------- | ---- |
| `gb`     | pick buffer           | n    |
| `gbd`    | pick buffer to delete | n    |

#### Git Operations
| Shortcut     | Action                 | Mode |
| ------------ | ---------------------- | ---- |
| `Space` `gs` | git status (lazygit)   | n    |
| `Space` `gb` | git blame current line | n    |
| `Space` `gr` | reset hunk             | n    |
| `Space` `g-` | previous hunk          | n    |
| `Space` `g=` | next hunk              | n    |
| `H`          | preview hunk           | n    |

#### LSP & Code Intelligence (CoC)
| Shortcut       | Action                        | Mode |
| -------------- | ----------------------------- | ---- |
| `gd`           | go to definition              | n    |
| `gy`           | go to type definition         | n    |
| `gi`           | go to implementation          | n    |
| `gr`           | list references               | n    |
| `K`            | show documentation            | n    |
| `Space` `rn`   | rename symbol                 | n    |
| `[g`           | previous diagnostic           | n    |
| `]g`           | next diagnostic               | n    |
| `Tab`          | trigger/navigate completion   | i    |
| `Shift` `Tab`  | navigate completion backwards | i    |
| `Ctrl` `Space` | trigger completion            | i    |
| `Ctrl` `j`     | expand snippet                | i    |

#### Terminal
| Shortcut               | Action                 | Mode |
| ---------------------- | ---------------------- | ---- |
| `Ctrl` `t`             | toggle terminal        | n    |
| `Ctrl` `\`             | open terminal          | n    |
| `Esc`                  | exit terminal mode     | t    |
| `Ctrl` `h` `j` `k` `l` | navigate from terminal | t    |

#### Editor Utilities
| Shortcut   | Action                        | Mode |
| ---------- | ----------------------------- | ---- |
| `Y`        | copy to system clipboard      | v    |
| `[c`       | go to context (treesitter)    | n    |
| `Ctrl` `n` | expand selection (treesitter) | n    |
| `z=`       | spell suggestions             | n    |

#### OpenCode (AI Assistant)
| Shortcut    | Action                            | Mode |
| ----------- | --------------------------------- | ---- |
| `Space` `k` | ask opencode (with @this context) | n, x |
| `Space` `x` | opencode action menu              | n, x |
| `Space` `i` | toggle opencode                   | n, t |
| `go`        | opencode operator (e.g. goip)     | n    |

#### Commands
| Command   | Action                |
| --------- | --------------------- |
| `:Format` | format current buffer |
| `:Fold`   | fold current buffer   |
| `:OR`     | organize imports      |
