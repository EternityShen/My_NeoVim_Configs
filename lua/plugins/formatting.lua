-- =============================================================================
-- formatting.lua - 代码格式化
-- =============================================================================

return {
  {
    "stevearc/conform.nvim",
    event = { "BufWritePre" },  -- 保存前触发加载
    cmd = { "ConformInfo" },    -- 输入 :ConformInfo 时加载
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
      -- ── 各语言的格式化工具 ──────────────────────
      -- 每种语言可以配置多个格式化工具，按顺序尝试
      -- 需要用 Mason 安装对应工具（:Mason 搜索安装）
      formatters_by_ft = {
        lua         = { "stylua" },
        python      = { "black", "isort" },
        -- black: 代码格式化；isort: import 排序
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

      -- ── 保存时自动格式化 ────────────────────────
      format_on_save = {
        timeout_ms = 500,      -- 超过 500ms 就放弃格式化（不阻塞保存）
        lsp_fallback = true,   -- 如果没有配置外部格式化工具，回退到 LSP 格式化
      },
    },
  },
}
