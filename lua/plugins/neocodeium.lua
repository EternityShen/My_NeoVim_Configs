return {
  -- neocodeium: AI 代码补全插件
  "monkoose/neocodeium",
  enabled = false,

  event = "VeryLazy",

  config = function()
    local neocodeium = require("neocodeium")

    neocodeium.setup()

    vim.keymap.set("i", "<A-w>", neocodeium.accept, { desc = "接受 AI 补全建议" })
  end,
}
