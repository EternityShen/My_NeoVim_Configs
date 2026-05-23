return {
  -- catppuccin.nvim: Catppuccin 主题插件
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000,

  config = function()
    require("catppuccin").setup({
      integrations = {
        cmp = false,
      },
    })

    vim.cmd.colorscheme("catppuccin")
  end,
}
