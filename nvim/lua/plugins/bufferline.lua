return {
  'akinsho/bufferline.nvim',
  version = "*",
  config = function()
    local bufferline = require('bufferline')
    bufferline.setup {
      options = {
        -- style_preset = bufferline.style_preset.no_italic,
        mode = "tabs",
        max_name_length = 12,
        max_prefix_length = 10, -- prefix used when a buffer is de-duplicated
        truncate_names = true, -- whether or not tab names should be truncated
        tab_size = 12,
        diagnostics = "coc",
        indicator = {
          icon = "",
          style = 'icon'
        },
        show_duplicate_prefix = false, -- whether to show duplicate buffer prefix
        show_tab_indicators = false,
        separator_style = "thin",
        show_buffer_close_icons = false,
      }
    }

    -- custom keymap
    vim.keymap.set("n", "gb", "<Cmd>BufferLinePick<CR>")
  end
}
