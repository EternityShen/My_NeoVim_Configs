return {
  -- nvim-web-devicons: 文件图标配置
  "nvim-tree/nvim-web-devicons",
  config = function()
    require("nvim-web-devicons").setup({
      override = {
        lua = { icon = "", color = "#7dcfff", name = "lua" },
      },
      override_by_extension = {
        slint = { icon = "", color = "#7dcfff", name = "slint" },
        js = { icon = "", color = "#e0af68", name = "js" },
        ts = { icon = "", color = "#7dcfff", name = "ts" },
        tsx = { icon = "", color = "#7dcfff", name = "tsx" },
        py = { icon = "", color = "#bb9af7", name = "py" },
        rs = { icon = "", color = "#ff007c", name = "rs" },
        go = { icon = "", color = "#2ac3de", name = "go" },
        html = { icon = "", color = "#f7768e", name = "html" },
        css = { icon = "", color = "#7dcfff", name = "css" },
        json = { icon = "", color = "#e0af68", name = "json" },
        md = { icon = "", color = "#c0caf5", name = "md" },
      },
    })
  end,
}
