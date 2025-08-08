return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
      -- Optional image support for file preview: See `# Preview Mode` for more information.
      -- {"3rd/image.nvim", opts = {}},
      -- OR use snacks.nvim's image module:
      -- "folke/snacks.nvim",
    },
    lazy = false, -- neo-tree will lazily load itself
    config = function()
      require("neo-tree").setup({
        close_if_last_window = true, -- 当关闭树时如果是最后一个窗口则退出Neovim
        window = {
          position = "left",
          width = 25,
        },
      })

      -- F3切换文件树
      vim.keymap.set("n", "<F3>", function()
        require("neo-tree.command").execute({ toggle = true })
      end, { desc = "Toggle NeoTree" })

      vim.keymap.set("n", "<leader>l", "<Cmd>Neotree reveal<CR>")
      -- vim.keymap.set("n", "<leader>b", "<Cmd>Neotree float buffers<CR>")
    end,
  },
}
