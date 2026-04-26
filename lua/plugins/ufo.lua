return {
  "kevinhwang91/nvim-ufo",
  dependencies = { "kevinhwang91/promise-async" },
  config = function()
    --使用 treesitter
    vim.o.foldmethod = "expr"
    vim.o.foldexpr = "v:lua.vim.treesitter.foldexpr()"

    -- 避免一打开全折叠
    vim.o.foldlevel = 99
    vim.o.foldlevelstart = 99

    require('ufo').setup({
      provider_selector = function(bufnr, filetype, buftype)
        return { "treesitter", "indent" }
      end
    })

    -- 局部折叠
    vim.keymap.set('n', 'zc', 'zc')
    vim.keymap.set('n', 'zo', 'zo')
    vim.keymap.set('n', 'za', 'za')

    -- 可选：全局折叠（调试用）
    vim.keymap.set('n', 'zM', require('ufo').closeAllFolds)
    vim.keymap.set('n', 'zR', require('ufo').openAllFolds)
  end
}
