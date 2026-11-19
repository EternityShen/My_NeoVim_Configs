-- =============================================================================
-- ufo.lua - UFO 代码折叠插件配置
-- =============================================================================
-- UFO 提供基于 Treesitter 的智能代码折叠功能
-- 支持多种折叠提供者，提供更好的折叠体验

return {
  -- UFO 插件仓库
  "kevinhwang91/nvim-ufo",
  
  -- 依赖项：异步 Promise 库
  dependencies = { "kevinhwang91/promise-async" },
  
  -- 插件配置函数
  config = function()
    -- 设置折叠方法为表达式模式
    vim.o.foldmethod = "expr"
    
    -- 使用 Treesitter 的折叠表达式
    vim.o.foldexpr = "v:lua.vim.treesitter.foldexpr()"

    -- 避免一打开文件就全部折叠
    vim.o.foldlevel = 99        -- 当前折叠级别
    vim.o.foldlevelstart = 99   -- 初始折叠级别

    -- UFO 插件配置
    require('ufo').setup({
      -- 折叠提供者选择器
      provider_selector = function(bufnr, filetype, buftype)
        -- 优先使用 Treesitter，回退到缩进模式
        return { "treesitter", "indent" }
      end
    })

    -- 局部折叠快捷键（保持默认行为）
    vim.keymap.set('n', 'zc', 'zc')  -- 关闭当前折叠
    vim.keymap.set('n', 'zo', 'zo')  -- 打开当前折叠
    vim.keymap.set('n', 'za', 'za')  -- 切换当前折叠

    -- 可选：全局折叠快捷键（调试用）
    vim.keymap.set('n', 'zM', require('ufo').closeAllFolds)  -- 关闭所有折叠
    vim.keymap.set('n', 'zR', require('ufo').openAllFolds)   -- 打开所有折叠
  end
}
