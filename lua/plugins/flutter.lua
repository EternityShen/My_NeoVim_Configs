return {
  {
    "akinsho/flutter-tools.nvim",
    lazy = false,
    dependencies = {
      "nvim-lua/plenary.nvim",
      "stevearc/dressing.nvim", -- 可选，提供更好的 UI 弹窗
    },
    config = function()
      require("flutter-tools").setup({
        flutter_path = "/opt/flutter/bin/flutter", -- 指定 Arch AUR 的 flutter 路径
        lsp = {
          color_render = true,

        }
      })
    end,
  },
}
