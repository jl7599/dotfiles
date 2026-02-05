return {
  "NickvanDyke/opencode.nvim",
  dependencies = {
    -- 用于更好的输入框和选择器界面
    { "folke/snacks.nvim", opts = { input = {}, picker = {}, terminal = {} } },
  },
  config = function()
    ---@type opencode.Opts
    vim.g.opencode_opts = {
      -- 可自定义 provider 或 prompts
    }

    -- 必须开启 autoread 以便 AI 修改文件后自动更新
    vim.o.autoread = true

    -- 快捷键配置
    local opencode = require("opencode")

    -- Ask: 提问（带 @this 上下文）
    vim.keymap.set({ "n", "x" }, "<leader>k", function()
      opencode.ask("@this: ", { submit = true })
    end, { desc = "Ask opencode..." })

    -- Select: 打开功能选择菜单
    vim.keymap.set({ "n", "x" }, "<leader>x", function()
      opencode.select()
    end, { desc = "Opencode Action..." })

    -- Toggle: 开启/关闭 opencode 界面
    vim.keymap.set({ "n", "t" }, "<leader>i", function()
      opencode.toggle()
    end, { desc = "Toggle opencode" })

    -- Operator: 接动作如 goip 发送段落
    vim.keymap.set("n", "go", function()
      opencode.operator()
    end, { desc = "Opencode operator" })
  end,
}
