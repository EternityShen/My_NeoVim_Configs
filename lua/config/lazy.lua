-- =============================================================================
-- lazy.lua - 插件管理器 lazy.nvim 的初始化配置
-- =============================================================================

-- ─────────────────────────────────────────────
-- 第一步：自动安装 lazy.nvim
-- ─────────────────────────────────────────────
-- 如果 lazy.nvim 还没安装，自动从 GitHub 克隆

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
-- stdpath("data") 在 Linux/macOS 是 ~/.local/share/nvim
-- 所以 lazy.nvim 会被安装到 ~/.local/share/nvim/lazy/lazy.nvim

if not vim.uv.fs_stat(lazypath) then
  -- 如果目录不存在，说明 lazy.nvim 还没安装
  print("正在安装 lazy.nvim，请稍候...")
  vim.fn.system({
    "git", "clone",
    "--filter=blob:none",           -- 浅克隆，只下载必要文件（更快）
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",              -- 使用稳定分支
    lazypath,
  })
end

-- 将 lazy.nvim 的路径加入 Neovim 的运行时路径
-- 这样 require("lazy") 才能找到它
vim.opt.rtp:prepend(lazypath)

-- ─────────────────────────────────────────────
-- 第二步：配置并启动 lazy.nvim
-- ─────────────────────────────────────────────

require("lazy").setup({
  -- spec 告诉 lazy.nvim 去哪里找插件定义文件
  spec = {
    -- 自动导入 lua/plugins/ 目录下的所有 .lua 文件
    { import = "plugins" },
  },

  -- ── 安装选项 ──────────────────────────────
  install = {
    colorscheme = { "catppuccin", "habamax" },
    -- 安装插件时使用的临时主题（catppuccin 是我们要装的主题，habamax 是内置备用）
  },

  -- ── 自动检查更新 ──────────────────────────
  checker = {
    enabled = true,   -- 开启自动检查更新
    notify = false,   -- 有更新时不弹通知（不干扰工作）
    frequency = 3600, -- 每小时检查一次（单位：秒）
  },

  -- ── 性能优化 ──────────────────────────────
  performance = {
    rtp = {
      -- 禁用 Neovim 内置的一些不常用插件，加快启动速度
      disabled_plugins = {
        "gzip",          -- .gz 文件支持
        "matchit",       -- % 跳转（用 treesitter 替代）
        "matchparen",    -- 括号匹配高亮（用 treesitter 替代）
        "netrwPlugin",   -- 内置文件管理器（用 nvim-tree 替代）
        "tarPlugin",     -- .tar 文件支持
        "tohtml",        -- :TOhtml 命令
        "tutor",         -- :Tutor 教程
        "zipPlugin",     -- .zip 文件支持
      },
    },
  },

  -- ── 界面设置 ──────────────────────────────
  ui = {
    border = "rounded",  -- lazy.nvim 管理界面的边框样式（rounded=圆角）
  },
})

-- 使用技巧：
-- :Lazy          → 打开插件管理界面
-- :Lazy sync     → 安装/更新/清理所有插件
-- :Lazy update   → 只更新插件
-- :Lazy clean    → 清理不再使用的插件
-- :Lazy health   → 检查插件健康状态
