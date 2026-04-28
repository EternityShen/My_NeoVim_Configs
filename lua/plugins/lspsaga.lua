return {
  "nvimdev/lspsaga.nvim",
  config = function()
    require("lspsaga").setup({})
  end,
  dependencies = {
    { "nvim-tree/nvim-web-devicons" },
  }
}
