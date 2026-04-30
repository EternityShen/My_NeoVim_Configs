-- =============================================================================
-- git.lua - Git 相关插件配置
-- =============================================================================
-- 提供 Git 集成功能，包括状态显示、差异高亮和 Git 操作界面

return {

  -- ─────────────────────────────────────────────
  -- 1. gitsigns：Git 状态显示
  -- ─────────────────────────────────────────────
  {
    "lewis6991/gitsigns.nvim",
    
    -- 在读取文件或创建新文件时加载
    event = { "BufReadPre", "BufNewFile" },
    
    -- 配置选项
    opts = {
      -- Git 状态图标设置
      signs = {
        add          = { text = "▎" }, -- 新增文件
        change       = { text = "▎" }, -- 修改文件
        delete       = { text = "_" }, -- 删除文件
        topdelete    = { text = "‾" }, -- 顶部删除
        changedelete = { text = "~" }, -- 修改+删除
        untracked    = { text = "▎" }, -- 未跟踪文件
      },
      
      -- 当前行 Git blame 信息（可选，已注释）
      -- current_line_blame = true,  -- 在当前行显示 Git blame 信息
      -- current_line_blame_opts = {
      --   delay = 1000,             -- 延迟 1 秒显示 blame 信息
      -- },
      
      -- 附加函数（用于快捷键映射）
      on_attach = function(bufnr)
        local gs = package.loaded.gitsigns
        -- 快捷键映射已迁移到 keymaps.lua
      end,
    },
  },

  -- ─────────────────────────────────────────────
  -- 2. lazygit：Neovim 内嵌 lazygit TUI
  -- ─────────────────────────────────────────────
  -- 需要先安装 lazygit：brew install lazygit
  {
    "kdheepak/lazygit.nvim",
    
    -- 命令触发加载
    cmd = { "LazyGit", "LazyGitCurrentFile" },
    
    -- 快捷键设置
    keys = {
      { "<leader>gg", ":LazyGit<CR>", desc = "打开 LazyGit" },
    },
    
    -- 依赖项
    dependencies = { "nvim-lua/plenary.nvim" },
  },
}
