return {
  -- lazygit.nvim: LazyGit 集成插件（备用配置）
  "kdheepak/lazygit.nvim",

  lazy = true,

  cmd = {
    "LazyGit",
    "LazyGitConfig",
    "LazyGitCurrentFile",
    "LazyGitFilter",
    "LazyGitFilterCurrentFile",
  },

  dependencies = {
    "nvim-lua/plenary.nvim",
  },
}
