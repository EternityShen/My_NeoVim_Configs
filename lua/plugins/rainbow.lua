--彩色括号

return {
  "HiPhish/rainbow-delimiters.nvim",
  dependencies = { "nvim-treesitter/nvim-treesitter" },
  config = function()
    local rainbow_delimiters = require("rainbow-delimiters")

    vim.g.rainbow_delimiters = {
      strategy = {
        [''] = rainbow_delimiters.strategy.global,
      },
      query = {
        [''] = 'rainbow-delimiters',
      },
    }
  end
}
