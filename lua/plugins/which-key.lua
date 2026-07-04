return {
  -- which-key.nvim: 快捷键提示插件
  "folke/which-key.nvim",

  event = "VeryLazy",

  config = function()
    local wk = require("which-key")

    wk.setup({
      preset = "modern",

      delay = 100,

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
        border = "rounded",
        padding = { 1, 1 },
        wo = {
          winblend = 0,
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

      { "<leader>c", group = "C/C++" },
      { "<leader>d", group = "调试操作" },
      { "<leader>b", group = "buffers操作" },
      { "<leader>l", group = "LSP" },
      { "<leader>g", group = "Git" },
      { "<leader>gg", desc = "LazyGit" },
      { "<leader>gs", desc = "暂存hunk" },
      { "<leader>gr", desc = "重置hunk" },
      { "<leader>gp", desc = "预览hunk" },

      { "<leader>n", desc = "minimap操作" },
      { "<leader>nw", desc = "当前窗口minimap操作" },
      { "<leader>nt", desc = "当前标签页minimap操作" },
      { "<leader>nb", desc = "当前缓冲区的minimap操作" },

      { "z", group = "代码折叠" },
      { "zM", desc = "关闭所有折叠" },
      { "zR", desc = "展开所有折叠" },
      { "zc", desc = "关闭当前折叠" },
      { "zo", desc = "展开当前折叠" },
      { "za", desc = "切换折叠" },

      { "ze", desc = "向左翻动窗口" },
      { "zs", desc = "向右翻动窗口" }

    })
  end,
}
