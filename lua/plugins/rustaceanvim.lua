-- =============================================================================
-- rustaceanvim.lua - RustaceanVim 插件配置
-- =============================================================================
-- 提供 Rust 语言开发的增强功能，包括 LSP 集成和开发工具
-- 完全控制 Rust Analyzer 的行为，提供更好的 Rust 开发体验

return {
  -- RustaceanVim 插件仓库
  "mrcjkb/rustaceanvim",
  
  -- 在打开 Rust 文件时加载
  ft = { "rust" },
  
  -- 依赖项
  dependencies = {
    "neovim/nvim-lspconfig",     -- LSP 配置
    "nvim-lua/plenary.nvim",     -- Lua 工具库
    "mfussenegger/nvim-dap",     -- 调试适配器协议
  },
  
  -- 插件选项
  opts = {
    server = {
      -- 禁用自动设置，由 rustaceanvim 完全控制
      standalone = true,
    },
  },
  
  -- 插件配置函数
  config = function(_, opts)
    -- 应用配置到全局变量
    vim.g.rustaceanvim = opts
  end,
}
