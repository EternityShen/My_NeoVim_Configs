-- =============================================================================
-- neocodeium.lua - Neocodeium AI 代码补全插件配置
-- =============================================================================
-- 提供基于 AI 的智能代码补全功能，类似 GitHub Copilot

return {
  -- Neocodeium 插件仓库
  "monkoose/neocodeium",
  enabled = false,

  -- 非常懒加载，只在需要时加载
  event = "VeryLazy",

  -- 插件配置函数
  config = function()
    -- 加载 Neocodeium 模块
    local neocodeium = require("neocodeium")

    -- 使用默认配置初始化
    neocodeium.setup()

    -- 接受 AI 补全建议
    vim.keymap.set("i", "<A-w>", neocodeium.accept, { desc = "接受 AI 补全建议" })
  end,
}
