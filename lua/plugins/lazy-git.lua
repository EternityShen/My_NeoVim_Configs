-- =============================================================================
-- lazy-git.lua - LazyGit 插件配置（备用配置）
-- =============================================================================
-- 这是 LazyGit 插件的备用配置文件，主配置在 git.lua 中
-- 提供 Git 操作的终端用户界面（TUI）集成

return {
  -- LazyGit 插件仓库
  "kdheepak/lazygit.nvim",
  
  -- 懒加载模式
  lazy = true,
  
  -- 触发加载的命令
  cmd = {
    "LazyGit",              -- 打开 LazyGit
    "LazyGitConfig",         -- 打开 LazyGit 配置
    "LazyGitCurrentFile",    -- 打开当前文件的 Git 状态
    "LazyGitFilter",         -- 带过滤器的 LazyGit
    "LazyGitFilterCurrentFile", -- 当前文件的过滤视图
  },
  
  -- 可选依赖，用于浮动窗口边框装饰
  dependencies = {
    "nvim-lua/plenary.nvim", -- Lua 工具库
  },
}
