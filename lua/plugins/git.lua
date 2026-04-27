-- =============================================================================
-- git.lua - Git 集成插件
-- =============================================================================

return {

  -- ─────────────────────────────────────────────
  -- 1. gitsigns：行号旁显示 git 变更状态
  -- ─────────────────────────────────────────────
  {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPre", "BufNewFile" },
    opts = {
      signs = {
        -- 在行号左侧显示 git 状态
        add          = { text = "│" }, -- 新增行（绿色竖线）
        change       = { text = "│" }, -- 修改行（黄色竖线）
        delete       = { text = "_" }, -- 删除行（红色下划线）
        topdelete    = { text = "‾" }, -- 顶部删除
        changedelete = { text = "~" }, -- 修改+删除
        untracked    = { text = "┆" }, -- 未跟踪文件
      },
      current_line_blame = true, -- 在当前行末显示 git blame 信息（谁最后修改了这行）
      current_line_blame_opts = {
        delay = 1000, -- 停留 1 秒后显示 blame 信息
      },
      on_attach = require("config.keymaps").gitsigns_on_attach,
    },
  },

  -- ─────────────────────────────────────────────
  -- 2. lazygit：在 Neovim 内使用 lazygit TUI
  -- ─────────────────────────────────────────────
  -- 需要先安装 lazygit：brew install lazygit
  {
    "kdheepak/lazygit.nvim",
    cmd = { "LazyGit", "LazyGitCurrentFile" },
    dependencies = { "nvim-lua/plenary.nvim" },
  },
}
