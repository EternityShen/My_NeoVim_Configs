-- =============================================================================
-- rust-crates.lua - Rust Crates 插件配置
-- =============================================================================
-- 提供 Cargo.toml 的增强功能：
--   - 依赖名补全（输入 crate 名称时从 crates.io 搜索）
--   - 版本号补全（选中 crate 后补全可用版本）
--   - features 补全
--   - 依赖版本升级提示与一键更新
--   - 悬浮查看 crate 信息 / 版本列表 / features

return {
  -- Rust Crates 插件仓库
  'saecki/crates.nvim',

  -- 使用稳定版本标签
  tag = 'stable',

  -- 只在打开 Cargo.toml 时加载，避免拖慢 Neovim 启动
  event = { 'BufRead Cargo.toml' },

  -- 插件配置函数
  config = function()
    local crates = require('crates')

    crates.setup({
      -- 打开 Cargo.toml 时自动加载依赖信息
      autoload = true,

      -- 编辑 Cargo.toml 时自动刷新依赖信息
      autoupdate = true,

      -- ── 补全配置 ──────────────────────────────
      completion = {
        -- 启用 nvim-cmp 补全源（依赖名 + 版本号 + features）
        -- 注意：还需要在 completion.lua 里把 "crates" 加入 cmp 的 sources
        cmp = { enabled = true },

        -- 补全时自动补上结尾的引号
        insert_closing_quote = true,
      },

      -- ── Cargo.toml 内置 LSP ───────────────────
      lsp = {
        enabled = true,
        actions = true,    -- 代码动作（一键升级版本等）
        completion = true, -- LSP 形式的补全
        hover = true,      -- K 悬浮查看 crate 信息
      },

      -- ── 弹窗样式 ──────────────────────────────
      popup = {
        border = 'rounded',            -- 圆角边框（和其他 UI 保持一致）
        show_version_date = true,      -- 版本列表里显示发布日期
        show_dependency_version = true -- 依赖列表里显示版本
      },

      -- ── Cargo.toml 专属快捷键 ─────────────────
      -- 只在 Cargo.toml 缓冲区生效，不影响其他文件
      on_attach = function(bufnr)
        local map = function(keys, func, desc)
          vim.keymap.set('n', keys, func,
            { buffer = bufnr, noremap = true, silent = true, desc = 'Crates: ' .. desc })
        end

        map('<leader>rh', crates.toggle, '显示/隐藏版本信息')
        map('<leader>rp', crates.show_popup, '显示依赖面板')
        map('<leader>rv', crates.show_versions_popup, '显示版本列表')
        map('<leader>rf', crates.show_features_popup, '显示 features')
        map('<leader>rD', crates.show_dependencies_popup, '显示依赖列表')
        map('<leader>ru', crates.update_crate, '更新当前依赖版本')
        map('<leader>rU', crates.update_all_crates, '更新全部依赖版本')
      end,
    })
  end,
}
