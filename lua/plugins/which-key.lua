-- ─────────────────────────────────────────────
-- which-key 配置（60键优化版）
-- ─────────────────────────────────────────────
return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  config = function()
    local wk = require("which-key")
    wk.setup({
      preset = "modern", -- 现代风格

      delay = 200,

      expand = 1,

      notify = false,

      plugins = {
        spelling = {
          enabled = true,
          suggestions = 20,
        },
        marks = false,
        registers = false,
        presets = {
          operators = false,
          motions = false,
          text_objects = false,
          windows = false,
          nav = false,
          z = true,
          g = true,
        },
      },

      win = {
        border = "rounded", -- 边框更柔和
        padding = { 1, 3 }, -- 内边距
        wo = {
          winblend = 30,    -- 透明度（0-100）
        },
      },

      layout = {
        width = { max = 60 },
        spacing = 3,
      },
      icons = {
        breadcrumb = "»",
        separator = "➜",
        group = "",
      },
      position = "center",

      show_help = true,
      show_keys = true,

      -- 忽略这些键的显示
      ignore_missing = true,
      hidden = {
        "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ ",
      },
    })

    wk.add({
      -- LSP
      { "gd", desc = "定义" },
      { "gD", desc = "声明" },
      { "gi", desc = "实现" },
      { "gr", desc = "引用" },
      { "K", desc = "悬浮文档" },
      { "]d", desc = "下一诊断" },
      { "[d", desc = "上一诊断" },
      { "]h", desc = "下一hunk" },
      { "[h", desc = "上一hunk" },

      -- Leader 键分组

      { "<leader>f", group = "搜索" },

      { "<leader>b", group = "buffers操作" },

      -- Git
      { "<leader>g", group = "Git" },
      { "<leader>gg", desc = "LazyGit" },
      { "<leader>gs", desc = "暂存hunk" },
      { "<leader>gr", desc = "重置hunk" },
      { "<leader>gp", desc = "预览hunk" },

      -- LSP 操作
      { "<leader>c", group = "窗口" },
      { "<leader>rn", desc = "重命名" },
      { "<leader>lf", desc = "格式化" },

      -- Rust
      { "<leader>r", group = "Rust" },
      { "<leader>rr", desc = "运行" },
      { "<leader>rt", desc = "测试" },
      { "<leader>rd", desc = "调试" },
      { "<leader>re", desc = "解释错误" },
      { "<leader>rc", desc = "Cargo.toml" },

      -- 折叠(Ufo)
      { "z", group = "代码折叠" },
      { "zM", desc = "关闭所有折叠" },
      { "zR", desc = "展开所有折叠" },
      { "zc", desc = "关闭当前折叠" },
      { "zo", desc = "展开当前折叠" },
      { "za", desc = "切换折叠" },
    })
  end,
}
