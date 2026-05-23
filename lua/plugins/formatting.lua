return {
  -- conform.nvim: 代码格式化插件
  {
    "stevearc/conform.nvim",
    event = { "BufWritePre" },
    cmd = { "ConformInfo" },
    keys = {
      {
        "<leader>lf",
        function()
          require("conform").format({ async = true, lsp_fallback = true })
        end,
        desc = "格式化当前文件",
      },
    },
    opts = {
      formatters_by_ft = {
        lua         = { "stylua" },
        python      = { "black", "isort" },
        javascript  = { "prettier" },
        typescript  = { "prettier" },
        javascriptreact = { "prettier" },
        typescriptreact = { "prettier" },
        json        = { "prettier" },
        yaml        = { "prettier" },
        markdown    = { "prettier" },
        html        = { "prettier" },
        css         = { "prettier" },
        rust        = { "rustfmt" },
        go          = { "gofmt", "goimports" },
        sh          = { "shfmt" },
      },

      format_on_save = {
        timeout_ms = 500,
        lsp_fallback = true,
      },
    },
  },
}
