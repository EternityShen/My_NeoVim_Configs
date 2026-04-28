--语法高亮
return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",

  opts = {
    ensure_installed = { "lua", "rust" },
    highlight = { enable = true },
    fold = { enable = true },
  },
}
