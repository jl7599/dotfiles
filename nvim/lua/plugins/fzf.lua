return {
  "ibhagwan/fzf-lua",
  -- optional for icon support
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local fzf = require('fzf-lua')
    -- <Ctrl+f> 模糊搜索
    vim.keymap.set('n', '<c-f>', function()
      -- fzf.live_grep_resume({ multiprocess = true, debug = true })
      fzf.grep({ search = "", fzf_opts = { ['--layout'] = 'default' } })
    end, m)
    vim.keymap.set('x', '<c-f>', function()
      -- fzf.live_grep_resume({ multiprocess = true, debug = true })
      fzf.grep_visual({ fzf_opts = { ['--layout'] = 'default' } })
    end, m)
    fzf.setup({
      global_resume = true,
      global_resume_query = true,
      winopts = {
        height     = 1,
        width      = 1,
        preview    = {
          layout = 'horizontal',
          scrollbar = 'float',
        },
        fullscreen = false,
        vertical   = 'down:45%', -- up|down:size
        horizontal = 'right:60%', -- right|left:size
        hidden     = 'nohidden',
      },
      keymap = {
        builtin = {
          ["<c-f>"]    = "toggle-fullscreen",
          ["<c-p>"]    = "toggle-preview",
          ["<c-d>"]    = "preview-page-down",
          ["<c-u>"]    = "preview-page-up",
        },
        fzf = {
          ["esc"]        = "abort",
        },
      },
    })
  end
}
