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
      -- rustaceanvim 默认就是独立模式（不经过 nvim-lspconfig），无需额外设置

      -- 传给 rust-analyzer 的语言服务器设置
      default_settings = {
        ["rust-analyzer"] = {
          -- 行内类型提示（灰色文字），由 Neovim 原生渲染
          inlayHints = {
            typeHints = { enable = true },      -- 变量类型
            parameterHints = { enable = true }, -- 参数名
            chainingHints = { enable = true },  -- 方法链类型
            closureReturnTypeHints = { enable = "never" }, -- 闭包返回类型（默认关，避免太吵）
          },
        },
      },
    },
  },

  -- 插件配置函数
  config = function(_, opts)
    -- 应用配置到全局变量
    vim.g.rustaceanvim = opts
  end,
}
