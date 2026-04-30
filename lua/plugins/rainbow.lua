-- =============================================================================
-- rainbow.lua - 彩虹括号插件配置
-- =============================================================================
-- 为不同层级的括号对显示不同的颜色，提高代码可读性

return {
  -- 彩虹括号插件仓库
  "HiPhish/rainbow-delimiters.nvim",
  
  -- 依赖项：Treesitter 语法分析器
  dependencies = { "nvim-treesitter/nvim-treesitter" },
  
  -- 插件配置函数
  config = function()
    -- 加载彩虹括号模块
    local rainbow_delimiters = require("rainbow-delimiters")

    -- 全局配置彩虹括号
    vim.g.rainbow_delimiters = {
      -- 策略配置
      strategy = {
        [''] = rainbow_delimiters.strategy.global,  -- 使用全局策略
      },
      
      -- 查询配置
      query = {
        [''] = 'rainbow-delimiters',  -- 使用 rainbow-delimiters 查询
      },
    }
  end
}
