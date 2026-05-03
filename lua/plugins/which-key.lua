-- =============================================================================
-- which-key.lua - 快捷键提示插件配置（60键优化版）
-- =============================================================================
-- Which-key 插件在按下 Leader 键后显示可用的快捷键组合
-- 帮助记忆和发现快捷键，提高编辑效率

return {
  -- Which-key 插件仓库
  "folke/which-key.nvim",

  -- 非常懒加载，只在需要时加载
  event = "VeryLazy",

  -- 插件配置函数
  config = function()
    local wk = require("which-key")

    -- 基础配置
    wk.setup({
      -- 使用现代风格预设
      preset = "modern",

      -- 延迟显示提示（ms），避免频繁闪烁
      delay = 200,

      -- 展开层级，1表示显示所有层级
      expand = 1,

      -- 不显示通知
      notify = false,

      -- 插件相关设置
      plugins = {
        spelling = {
          enabled = true,       -- 启用拼写检查
          suggestions = 20,     -- 显示最多20个拼写建议
        },
        marks = false,          -- 禁用标记功能
        registers = false,      -- 禁用寄存器功能
        presets = {
          operators = false,    -- 禁用操作符预设
          motions = false,      -- 禁用移动预设
          text_objects = false, -- 禁用文本对象预设
          windows = false,      -- 禁用窗口预设
          nav = false,          -- 禁用导航预设
          z = true,             -- 启用折叠相关快捷键
          g = true,             -- 启用文本操作相关快捷键
        },
      },

      -- 提示窗口样式
      win = {
        border = "rounded", -- 圆角边框
        padding = { 1, 3 }, -- 内边距（上下1行，左右3字符）
        wo = {
          winblend = 30,    -- 窗口透明度（0-100）
        },
      },

      -- 布局设置
      layout = {
        width = { max = 60 }, -- 最大宽度60字符
        spacing = 3,          -- 间距3字符
      },

      -- 图标设置
      icons = {
        breadcrumb = "»", -- 面包屑图标
        separator = "➜", -- 分隔符图标
        group = "", -- 分组图标
      },

      -- 窗口位置居中显示
      position = "center",

      -- 显示帮助信息和快捷键
      show_help = true,
      show_keys = true,
    })

    wk.add({

      -- Leader 键快捷键
      { "<leader>d", group = "调试操作" },
      { "<leader>b", group = "buffers操作" },
      { "<leader>l", group = "LSP" },
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

      { "ze", desc = "向左翻动窗口" },
      { "zs", desc = "向右翻动窗口" }


    })
  end,
}
