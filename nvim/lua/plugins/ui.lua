return {
  -- Colorscheme
  {
    "sainnhe/gruvbox-material",
    lazy = false,
    priority = 1000,
    config = function()
      -- load the colorscheme here
      vim.opt.background = "dark" -- dark or light
      vim.g.gruvbox_material_background = "soft" -- sort or hard
      vim.cmd([[colorscheme gruvbox-material]])
      vim.cmd([[highlight Normal guibg=NONE ctermbg=None]])
    end,
  },
}
