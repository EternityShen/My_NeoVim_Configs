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

    })

    wk.add({

      { "<leader>b", group = "buffers操作" },

      -- Git
      { "<leader>g", group = "Git" },
      { "<leader>gg", desc = "LazyGit" },
      { "<leader>gs", desc = "暂存hunk" },
      { "<leader>gr", desc = "重置hunk" },
      { "<leader>gp", desc = "预览hunk" },

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
