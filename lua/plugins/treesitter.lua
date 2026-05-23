return {
  -- nvim-treesitter: Treesitter 语法高亮和代码分析插件
  "nvim-treesitter/nvim-treesitter",

  build = ":TSUpdate",

  opts = {
    ensure_installed = {
      "lua",
      "rust"
    },

    highlight = { enable = true },

    fold = { enable = true },
  },
}
