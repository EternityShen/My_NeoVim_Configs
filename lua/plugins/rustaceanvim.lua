-- =============================================================================
-- rustaceanvim.lua - RustaceanVim 插件配置
-- =============================================================================
-- 提供 Rust 语言开发的增强功能，包括 LSP 集成和开发工具



return {
  "mrcjkb/rustaceanvim",
  ft = { "rust" },
  dependencies = {
    "neovim/nvim-lspconfig",
    "nvim-lua/plenary.nvim",
    "mfussenegger/nvim-dap",
  },
  opts = {
    server = {
      -- 禁用自动设置，由 rustaceanvim 完全控制
      standalone = true,
    },

  },
  config = function(_, opts)
    vim.g.rustaceanvim = opts
  end,
}
