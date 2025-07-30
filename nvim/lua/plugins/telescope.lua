return {
  'nvim-telescope/telescope.nvim', tag = '0.1.8',
  dependencies = {
    'nvim-lua/plenary.nvim',
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
  },
  config = function ()
    local telescope = require 'telescope'
    local builtin = require('telescope.builtin')
    vim.keymap.set('n', '<leader><leader>', builtin.find_files, { desc = 'Telescope find files' })
    vim.keymap.set('n', '<leader>b', builtin.buffers, { desc = 'Telescope buffers' })
    vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
    vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })
    vim.keymap.set('n', '<leader>of', builtin.oldfiles, { desc = 'Oldfiles' })
    vim.keymap.set('n', '<leader>ag', builtin.grep_string, { desc = 'Search cursor string' })
    vim.keymap.set('n', 'z=', builtin.spell_suggest )
    require('telescope').setup{
      defaults = {
        layout_config = {
          -- prompt_position = 'top',
          horizontal = {
            -- set to `false` if you want the input to be on the left and
            -- preview on the right
            mirror = false,
            preview_cutoff = 100,
            preview_width = 0.5,
          },
          vertical = {
            mirror = true,
            preview_cutoff = 0.4,
          },
          flex = {
            flip_columns = 200,
          },
          height = 0.95,
          width = 0.95,
        },
        -- https://github.com/nvim-telescope/telescope.nvim/wiki/Configuration-Recipes#ignore-files-bigger-than-a-threshold
        preview = {
          filesize_limit = 1.0, -- MB
        },
        mappings = {
          i = {
            ["<C-h>"] = "which_key",
            ["<C-k>"] = "move_selection_previous",
            ["<C-j>"] = "move_selection_next",
            ["<C-u>"] = "preview_scrolling_up",
            ["<C-d>"] = "preview_scrolling_down",
            ["<esc>"] = "close",
            ["<C-n>"] = require('telescope.actions').cycle_history_next,
            ["<C-p>"] = require('telescope.actions').cycle_history_prev,
          }
        },
        color_devicons = true,
        prompt_prefix = "🔍 ",
        selection_caret = " ",
        path_display = { "truncate" },
        file_previewer = require("telescope.previewers").vim_buffer_cat.new,
        grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
      },
      pickers = {
        -- Default configuration for builtin pickers goes here:
        -- picker_name = {
        --   picker_config_key = value,
        --   ...
        -- }
        -- Now the picker_config_key will be applied every time you call this
        -- builtin picker
        buffers = {
          sort_lastused = true
        }
      },
      extensions = {
        fzf = {
          fuzzy = true,
          override_generic_sorter = true,
          override_file_sorter = true,
          case_mode = "smart_case",
        },
      }
    }
    -- load fzf native extension
    telescope.load_extension("fzf")
  end
}
