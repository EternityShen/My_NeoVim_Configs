return {
  "uga-rosa/ccc.nvim",
  keys = {
    { "<leader>p", "<cmd>CccPick<CR>", desc = "打开调色盘" },
  },
  config = function()
    local ccc = require("ccc")
    ccc.setup({
      -- 开启颜色高亮
      highlighter = {
        auto_enable = true,
        lsp = true,
      },
    })
  end
}
