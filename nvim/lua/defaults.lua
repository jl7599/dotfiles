vim.o.termguicolors = true
vim.env.NVIM_TUI_ENABLE_TRUE_COLOR = 1

vim.o.ttyfast = true
vim.o.autochdir = false
vim.o.number = true
vim.o.secure = false
vim.o.exrc = true
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.cursorline = true
vim.o.expandtab = true
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.softtabstop = 4
vim.o.smartindent = true
vim.o.smarttab = true
vim.o.list = true
vim.o.listchars = "tab:|\\ ,trail:."
vim.o.scrolloff = 7
vim.o.splitright = true
vim.o.splitbelow = true
vim.o.lazyredraw = true
vim.o.visualbell = true
vim.o.foldmethod = "indent"
vim.o.foldlevel = 99
vim.o.foldenable = true
vim.o.hidden = true
vim.o.updatetime = 100
vim.o.shortmess = vim.o.shortmess .. "c"
vim.o.signcolumn = "yes"
vim.o.formatoptions = vim.o.formatoptions:gsub("tc", "")
vim.o.viewoptions = "cursor,folds,slash,unix"
vim.o.inccommand = "split"
vim.o.completeopt = "longest,noinsert,menuone,noselect,preview"
vim.o.completeopt = "menuone,noinsert,noselect,preview"

vim.cmd([[
silent !mkdir -p $HOME/.config/nvim/tmp/backup
silent !mkdir -p $HOME/.config/nvim/tmp/undo
"silent !mkdir -p $HOME/.config/nvim/tmp/sessions
set backupdir=$HOME/.config/nvim/tmp/backup,.
set directory=$HOME/.config/nvim/tmp/backup,.
if has('persistent_undo')
    set undofile
    set undodir=$HOME/.config/nvim/tmp/undo,.
endif
]])

-- 恢复上次编辑位置
vim.cmd(
  [[au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif]]
)

vim.cmd([[autocmd TermOpen term://* startinsert]])

-- 自动重载配置
vim.cmd([[
augroup NVIMRC
    autocmd!
    autocmd BufWritePost .vim.lua exec ":so %"
augroup END
]])

vim.cmd([[hi NonText ctermfg=gray guifg=grey10]])

local config_path = vim.fn.stdpath("config")
local current_config_path = config_path .. "/lua/machine_specific.lua"
if not vim.loop.fs_stat(current_config_path) then
  local current_config_file = io.open(current_config_path, "wb")
  local default_config_path = config_path .. "/default_config/_machine_specific_default.lua"
  local default_config_file = io.open(default_config_path, "rb")
  if default_config_file and current_config_file then
    local content = default_config_file:read("*all")
    current_config_file:write(content)
    io.close(default_config_file)
    io.close(current_config_file)
  end
end
require("machine_specific")
