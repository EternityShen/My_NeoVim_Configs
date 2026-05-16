return {
  "LmanTW/themify.nvim",
  lazy = false,
  priority = 999,
  config = function()
    require("themify").setup({

      -- 暗色系
      "catppuccin/nvim",
      "rebelot/kanagawa.nvim",
      "folke/tokyonight.nvim",
      "EdenEast/nightfox.nvim",
      "AlexvZyl/nordic.nvim",

      -- 高对比
      "ellisonleao/gruvbox.nvim",
      "olimorris/onedarkpro.nvim",
      activity = {
        enabled = true,
      },

      livePreview = true,
    })
  end,
}
