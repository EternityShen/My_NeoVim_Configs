return {
  -- inlay-hints.nvim: 行内类型提示插件
  "MysticalDevil/inlay-hints.nvim",

  event = "LspAttach",
  dependencies = { "neovim/nvim-lspconfig" },

  config = function()
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
