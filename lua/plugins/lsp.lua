-- =============================================================================
-- lsp.lua - LSP 语言服务器配置
-- =============================================================================
-- 整体流程：
-- mason.nvim（安装管理 LSP 服务器）
--   → mason-lspconfig.nvim（桥接 mason 和 nvim-lspconfig）
--     → nvim-lspconfig（配置 LSP 服务器）

return {

  -- ─────────────────────────────────────────────
  -- 1. Mason：LSP 服务器安装管理器
  -- ─────────────────────────────────────────────
  {
    "williamboman/mason.nvim",
    cmd = "Mason",          -- 输入 :Mason 时加载
    build = ":MasonUpdate", -- 插件更新时同步更新 Mason 的包索引
    opts = {
      ui = {
        border = "rounded", -- 界面边框样式
        icons = {
          package_installed   = "✓", -- 已安装图标
          package_pending     = "➜", -- 安装中图标
          package_uninstalled = "✗", -- 未安装图标
        },
      },
    },
  },

  -- ─────────────────────────────────────────────
  -- 2. mason-lspconfig：Mason 和 lspconfig 的桥梁
  -- ─────────────────────────────────────────────
  {
    "williamboman/mason-lspconfig.nvim",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "williamboman/mason.nvim",
      "neovim/nvim-lspconfig",
    },
    config = function()
      -- ── 通用 LSP 键位映射 ──────────────────────────
      -- 这些快捷键在任何有 LSP 支持的文件里都可以用
      local on_attach = function(client, bufnr)
        -- on_attach 在 LSP 服务器连接到 buffer 时执行

        local map = function(keys, func, desc)
          vim.keymap.set("n", keys, func,
            { buffer = bufnr, noremap = true, silent = true, desc = "LSP: " .. desc })
        end

        -- 跳转
        map("gd", vim.lsp.buf.definition, "跳转到定义")
        map("gD", vim.lsp.buf.declaration, "跳转到声明")
        map("gi", vim.lsp.buf.implementation, "跳转到实现")
        map("gr", require("telescope.builtin").lsp_references, "查看所有引用")
        map("gt", vim.lsp.buf.type_definition, "跳转到类型定义")

        -- 查看信息
        map("K", vim.lsp.buf.hover, "悬浮文档（按两次进入）")
        map("<C-k>", vim.lsp.buf.signature_help, "函数签名帮助")
        map("<leader>li", vim.lsp.buf.incoming_calls, "查看调用者")

        -- 重构
        map("<leader>lr", vim.lsp.buf.rename, "重命名变量")
        map("<leader>la", vim.lsp.buf.code_action, "代码动作（修复建议）")

        -- 诊断信息（错误/警告）
        map("<leader>ld", vim.diagnostic.open_float, "查看当前行诊断详情")
        map("[d", vim.diagnostic.goto_prev, "跳到上一个诊断")
        map("]d", vim.diagnostic.goto_next, "跳到下一个诊断")

        -- 格式化（如果 LSP 支持）
        if client.server_capabilities.documentFormattingProvider then
          map("<leader>lf", function() vim.lsp.buf.format({ async = true }) end, "格式化代码")
        end
      end

      -- ── 补全能力声明 ──────────────────────────────
      -- 告诉 LSP 服务器，Neovim 支持哪些补全特性
      -- 需要 nvim-cmp 的 LSP 扩展来增强这些能力
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      -- 如果安装了 nvim-cmp，用它来增强能力（后面章节会装）
      local has_cmp, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
      if has_cmp then
        capabilities = cmp_nvim_lsp.default_capabilities(capabilities)
      end

      -- ── 诊断信息显示设置 ──────────────────────────
      vim.diagnostic.config({
        virtual_text = {
          prefix = "●", -- 错误/警告在行尾显示的前缀图标
        },
        signs = true, -- 在行号左侧显示错误/警告图标
        update_in_insert = false, -- 插入模式下不更新诊断（避免打字时闪烁）
        severity_sort = true, -- 按严重程度排序（错误 > 警告 > 提示）
        float = {
          border = "rounded", -- 悬浮诊断窗口的边框
          source = "always", -- 总是显示诊断来源（哪个 LSP 报告的）
        },
      })

      -- ── 设置诊断图标 ──────────────────────────────
      local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
      for type, icon in pairs(signs) do
        local hl = "DiagnosticSign" .. type
        vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
      end

      -- ── 配置要自动安装的 LSP 服务器 ───────────────
      require("mason-lspconfig").setup({
        ensure_installed = {
          -- 根据你的需求添加
          "lua_ls",        -- Lua（写 Neovim 配置必备）
          "rust_analyzer", -- Rust

        },
        automatic_installation = true, -- 自动安装上面列表中的服务器
      })
    end,
  },

  -- ─────────────────────────────────────────────
  -- 3. 更好的 LSP 提示 UI
  -- ─────────────────────────────────────────────
  -- {
  --   "nvimdev/lspsaga.nvim",
  --   event = "LspAttach",  -- LSP 连接到 buffer 时才加载
  --   dependencies = {
  --     "nvim-treesitter/nvim-treesitter",
  --     "nvim-tree/nvim-web-devicons",
  --   },
  --   opts = {
  --     ui = { border = "rounded" },
  --     lightbulb = { enable = false },  -- 关闭灯泡图标（避免闪烁）
  --   },
  -- },
}
