-- ─────────────────────────────────────────────
-- which-key 配置（60键优化版）
-- ─────────────────────────────────────────────
return {
  "folke/which-key.nvim",
  event = "VeryLazy",

  config = function()
    require("which-key").setup({
      preset = "modern", -- 现代风格（重点！）

      delay = 200,

      expand = 1,

      notify = false,

      plugins = {
        spelling = {
          enabled = true,
          suggestions = 20,
        },
      },

      win = {
        border = "rounded", -- 边框更柔和
        padding = { 1, 3 }, -- 内边距
        wo = {
          winblend = 10,    -- 透明度（0-100）
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
    local wk = require("which-key")
    wk.setup()

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
      { "<leader>w", group = "窗口" },
      { "<leader>wv", desc = "垂直分割" },
      { "<leader>wh", desc = "水平分割" },
      { "<leader>wc", desc = "关闭窗口" },
      { "<leader>wo", desc = "关闭其他" },
      { "<leader>wr", desc = "旋转窗口" },
      { "<leader>wm", desc = "最大化窗口" },
      { "<leader>w=", desc = "平衡窗口" },
      { "<leader>q", desc = "退出" },
      { "<leader>Q", desc = "全部退出" },
      { "<leader>e", desc = "文件树" },
      { "<leader>f", group = "搜索" },
      { "<leader>ff", desc = "找文件" },
      { "<leader>fb", desc = "找buffer" },
      { "<leader>fr", desc = "最近文件" },
      { "<leader>fg", desc = "全局搜索" },
      { "<leader>fw", desc = "搜索词" },
      { "<leader>fc", desc = "当前文件搜索" },
      { "<leader>fs", desc = "文件符号" },
      { "<leader>fS", desc = "工作区符号" },
      { "<leader>fh", desc = "帮助文档" },
      { "<leader>fk", desc = "快捷键" },
      { "<leader>f:", desc = "命令" },
      { "<leader>fd", desc = "诊断信息" },
      { "<leader>f/", desc = "继续搜索" },
      { "<leader>g", desc = "搜索内容" },
      { "<leader>b", group = "buffers操作" },

      -- Git
      { "<leader>g", group = "Git" },
      { "<leader>gg", desc = "LazyGit" },
      { "<leader>gs", desc = "暂存hunk" },
      { "<leader>gr", desc = "重置hunk" },
      { "<leader>gp", desc = "预览hunk" },

      -- LSP 操作
      { "<leader>c", group = "代码" },
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
