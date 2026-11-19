-- =============================================================================
-- treesitter.lua - Treesitter 语法高亮和代码分析插件
-- =============================================================================
-- Treesitter 提供更精确的语法高亮、代码折叠、智能选择等功能

return {
  -- Treesitter 插件仓库
  "nvim-treesitter/nvim-treesitter",
  
  -- 安装后运行 Treesitter 更新命令，确保语法解析器最新
  build = ":TSUpdate",

  -- 插件配置选项
  opts = {
    -- 确保安装指定的语法解析器
    ensure_installed = { 
      "lua",  -- Lua 语言（Neovim 配置必需）
      "rust"  -- Rust 语言
    },
    
    -- 启用语法高亮功能
    highlight = { enable = true },
    
    -- 启用基于语法树的代码折叠
    fold = { enable = true },
  },
}
