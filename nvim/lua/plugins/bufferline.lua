return {
  "akinsho/bufferline.nvim",
  version = "*",
  config = function()
    local bufferline = require("bufferline")
    bufferline.setup({
      options = {
        mode = "tabs",
        -- style_preset = bufferline.style_preset.no_italic,
        style_preset = { bufferline.style_preset.minimal },
        max_name_length = 12,
        max_prefix_length = 10, -- prefix used when a buffer is de-duplicated
        truncate_names = true, -- whether or not tab names should be truncated
        tab_size = 12,
        hover = { enabled = true, reveal = { "close" } },
        diagnostics = "coc",
        -- indicator = { style = "underline" },
        indicator = {
          icon = "",
          style = "icon",
        },
        show_duplicate_prefix = false, -- whether to show duplicate buffer prefix
        show_tab_indicators = false,
        separator_style = "thin",
        show_buffer_close_icons = true,
        move_wraps_at_ends = true,
        right_mouse_command = "vert sbuffer %d",
        show_close_icon = true,
        offsets = {
          {
            text = "EXPLORER",
            filetype = "neo-tree",
            highlight = "PanelHeading",
            text_align = "left",
            separator = true,
          },
        },
      },
    })

    -- custom keymap
    vim.keymap.set("n", "gb", "<Cmd>BufferLinePick<CR>")
    vim.keymap.set(
      "n",
      "gbd",
      "<Cmd>BufferLinePickClose<CR>",
      { desc = "bufferline: delete buffer" }
    )
  end,
}
