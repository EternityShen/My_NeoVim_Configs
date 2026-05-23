return {
  -- lspsaga.nvim: LSP UI 增强插件
  "nvimdev/lspsaga.nvim",

  dependencies = {
    { "nvim-tree/nvim-web-devicons" },
  },

  opts = {
    lightbulb = {
      enable = false,
    },
  }
}
