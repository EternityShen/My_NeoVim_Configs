-- =============================================================================
-- catppuccin.lua - Catppuccin 主题插件配置
-- =============================================================================
-- Catppuccin 是一个现代化的、支持多种配色方案的主题

return{
  -- 插件仓库地址
  "catppuccin/nvim",
  
  -- 插件名称（用于 lazy.nvim 管理）
  name = "catppuccin",
  
  -- 优先级设置为最高（1000），确保主题最先加载
  priority = 1000,
  
  -- 插件配置函数
  config = function()
    -- 调用 Catppuccin 的默认配置
    require("catppuccin").setup()
    
    -- 应用 Catppuccin 主题
    vim.cmd.colorscheme "catppuccin"
  end,
}