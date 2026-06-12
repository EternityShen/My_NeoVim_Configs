return {
  -- themify.nvim: 主题管理器插件
  "LmanTW/themify.nvim",
  lazy = false,
  priority = 999,
  config = function()
    require("themify").setup({

      "catppuccin/nvim",
      "rebelot/kanagawa.nvim",
      "folke/tokyonight.nvim",
      "EdenEast/nightfox.nvim",
      "AlexvZyl/nordic.nvim",

      "ellisonleao/gruvbox.nvim",
      "olimorris/onedarkpro.nvim",

      "rose-pine/neovim",
      "avoonix/pink-as-fox.nvim",
      "sponkurtus2/angelic.nvim",
      "daltonmenezes/aura-theme",
      "uhs-robert/oasis.nvim",

      "rijulpaul/nightblossom.nvim",

      "Mofiqul/dracula.nvim",
      activity = {
        enabled = true,
      },

      livePreview = true,
    })
  end,
}
