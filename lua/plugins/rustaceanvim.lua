-- =============================================================================
-- rustaceanvim.lua - RustaceanVim 插件配置
-- =============================================================================
-- 提供 Rust 语言开发的增强功能，包括 LSP 集成和开发工具

return {
  -- RustaceanVim 插件仓库
  'mrcjkb/rustaceanvim',
  
  -- 非懒加载模式，立即加载
  lazy = false,
  
  -- 仅在 Rust 文件类型时加载
  ft = { 'rust' },
  
  -- 插件配置函数
  configs = function()
    -- 启用自动行内类型提示
    tools.inlay_hints.auto = true
  end
}
