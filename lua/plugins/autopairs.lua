return {
  -- nvim-autopairs: 自动括号配对插件
  "windwp/nvim-autopairs",

  config = function()
    require("nvim-autopairs").setup {}
  end
}
