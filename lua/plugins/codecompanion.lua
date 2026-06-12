return {
  "olimorris/codecompanion.nvim",
  enadle = false,
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
  },
  keys = {
    { "<leader>ac", "<cmd>CodeCompanionChat Toggle<cr>", mode = { "n", "v" }, desc = "AI: 切换聊天面板" },
    { "<leader>aa", "<cmd>CodeCompanionActions<cr>", mode = { "n", "v" }, desc = "AI: 动作面板" },
    { "<leader>ai", "<cmd>CodeCompanion<cr>", mode = { "n", "v" }, desc = "AI: 内联补全" },
    { "<leader>an", "<cmd>CodeCompanionChat<cr>", mode = { "n", "v" }, desc = "AI: 新建对话" },
    { "ga", "<cmd>CodeCompanionChat Add<cr>", mode = "v", desc = "AI: 添加选中代码" },
  },
  opts = {
    adapters = {
      http = {
        deepseek = function()
          return require("codecompanion.adapters").extend("deepseek", {
            env = { api_key = "DEEPSEEK_API_KEY" },
            schema = {
              model = { default = "deepseek-chat" },
            },
          })
        end,
      },
    },
    interactions = {
      chat   = {
        adapter = "deepseek",
        keymaps = {
          stop  = { modes = { n = "<C-x>" }, description = "停止生成" },
          clear = { modes = { n = "<leader>cl" }, description = "清空对话" },
        },
      },
      inline = { adapter = "deepseek" },
      cmd    = { adapter = "deepseek" },
    },
    opts = {

    },
  },
}
