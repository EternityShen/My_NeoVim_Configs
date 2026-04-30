-- =============================================================================
-- rust-crates.lua - Rust Crates 插件配置
-- =============================================================================
-- 提供 Rust 项目的 Cargo.toml 文件增强功能，包括依赖管理和版本检查

return {
  -- Rust Crates 插件仓库
  'saecki/crates.nvim',

  -- 使用稳定版本标签
  tag = 'stable',

  -- 插件配置函数
  config = function()
    -- 使用默认配置初始化 Rust Crates 插件
    require('crates').setup()
  end,
}
