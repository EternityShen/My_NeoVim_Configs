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

      --粉色
      "rose-pine/neovim",
      "avoonix/pink-as-fox.nvim",
      "sponkurtus2/angelic.nvim",
      "daltonmenezes/aura-theme",
      "uhs-robert/oasis.nvim",
      activity = {
        enabled = true,
      },

      livePreview = true,
    })
  end,
}
