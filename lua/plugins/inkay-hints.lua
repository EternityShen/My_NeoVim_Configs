-- =============================================================================
-- inkay-hints.lua - 行内类型提示插件配置
-- =============================================================================
-- 在代码行内显示类型推导信息，帮助理解代码类型

return {
  -- 行内类型提示插件仓库
  "MysticalDevil/inlay-hints.nvim",

  -- 在 LSP 附加到缓冲区时加载
  event = "LspAttach",
  -- 依赖项：LSP 配置插件
  dependencies = { "neovim/nvim-lspconfig" },

  -- 插件配置函数
  config = function()
    -- 使用默认配置初始化行内类型提示
    local orig_set = vim.lsp.inlay_hint.set
    vim.lsp.inlay_hint.set = function(...)
      local ok, err = pcall(orig_set, ...)
      if not ok then
        if not err:match("out of range") then
          vim.notify(err, vim.log.levels.ERROR)
        end
      end
    end
    require("inlay-hints").setup()
  end
}
