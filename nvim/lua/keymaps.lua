-- 空格键是 leader 键
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

local mode_nv = { "n", "v" }
local mode_v = { "v" }
local mode_i = { "i" }

local nmappings = {
  -- 复制到系统粘贴板
  { from = "Y", to = '"+y', mode = mode_v },

  -- window move
  { from = "<C-l>", to = "<C-w>l" },
  { from = "<C-h>", to = "<C-w>h" },
  { from = "<C-j>", to = "<C-w>j" },
  { from = "<C-k>", to = "<C-w>k" },

  -- window split
  { from = "s", to = "<nop>" },
  { from = "sh", to = ":set splitbelow<CR>:split<CR>" },
  { from = "sv", to = ":set splitright<CR>:vsplit<CR>" },
  { from = "<leader>w", to = ":bd!<CR>" },

  -- tab edit
  { from = "te", to = ":tabe<CR>" },
  { from = "tp", to = ":-tabnext<CR>" },
  { from = "tn", to = ":+tabnext<CR>" },
}
for _, mapping in ipairs(nmappings) do
  vim.keymap.set(mapping.mode or "n", mapping.from, mapping.to, { noremap = true })
end
