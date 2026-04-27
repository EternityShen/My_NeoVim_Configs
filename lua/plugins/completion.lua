-- =============================================================================
-- completion.lua - 自动补全系统
-- =============================================================================
-- nvim-cmp 是补全框架，它本身不提供补全内容
-- 补全内容来自各种"来源"（source）：
--   - LSP（代码智能补全）
--   - buffer（当前文件中已有的词）
--   - path（文件路径补全）
--   - luasnip（代码片段）

return {

  -- ─────────────────────────────────────────────
  -- 1. 代码片段引擎：LuaSnip
  -- ─────────────────────────────────────────────
  {
    "L3MON4D3/LuaSnip",
    version = "v2.*",
    build = "make install_jsregexp", -- 编译正则支持（可选）
    dependencies = {
      -- 预置的各语言代码片段集合
      "rafamadriz/friendly-snippets",
    },
    config = function()
      local luasnip = require("luasnip")
      -- 加载预置代码片段
      require("luasnip.loaders.from_vscode").lazy_load()
      -- 支持从 VSCode 格式的 snippet 文件加载（friendly-snippets 就是这种格式）

      -- LuaSnip 键映射已迁移到 keymaps.lua
    end,
  },

  -- ─────────────────────────────────────────────
  -- 2. nvim-cmp：补全框架主体
  -- ─────────────────────────────────────────────
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",        -- 进入插入模式时加载
    dependencies = {
      "L3MON4D3/LuaSnip",         -- 代码片段引擎
      "saadparwaiz1/cmp_luasnip", -- LuaSnip 的 cmp source
      "hrsh7th/cmp-nvim-lsp",     -- LSP 补全 source
      "hrsh7th/cmp-buffer",       -- 当前 buffer 词汇补全
      "hrsh7th/cmp-path",         -- 文件路径补全
      "hrsh7th/cmp-cmdline",      -- 命令行补全
      "onsails/lspkind.nvim",     -- 补全菜单图标（显示类型图标）
    },
    config = function()
      local cmp = require("cmp")
      local luasnip = require("luasnip")
      local lspkind = require("lspkind")

      cmp.setup({
        -- ── 代码片段扩展配置 ──────────────────────
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body) -- 使用 LuaSnip 展开片段
          end,
        },

        -- ── 补全窗口样式 ──────────────────────────
        window = {
          completion    = cmp.config.window.bordered(), -- 带边框的补全窗口
          documentation = cmp.config.window.bordered(), -- 带边框的文档窗口
        },

        -- ── 键位映射 ──────────────────────────────
        mapping = require("config.keymaps").cmp_mappings(),

        -- ── 补全来源配置 ──────────────────────────
        -- 按优先级从高到低排列，排在前面的补全结果会靠前显示
        sources = cmp.config.sources({
          { name = "nvim_lsp", priority = 1000 }, -- LSP 补全（最高优先级）
          { name = "luasnip",  priority = 750 },  -- 代码片段
          { name = "buffer",   priority = 500 },  -- 当前文件词汇
          { name = "path",     priority = 250 },  -- 文件路径
        }),

        -- ── 补全菜单格式化（显示图标和来源）────────
        formatting = {
          format = lspkind.cmp_format({
            mode = "symbol_text",  -- 显示图标 + 文字
            maxwidth = 50,         -- 最大宽度
            ellipsis_char = "...", -- 超出时显示省略号
            -- 每种类型对应的图标（lspkind 已内置，这里可自定义）
            symbol_map = {
              Text        = "󰉿",
              Method      = "󰆧",
              Function    = "󰊕",
              Constructor = "",
              Variable    = "󰀫",
              Class       = "󰠱",
              Interface   = "",
              Module      = "",
              Snippet     = "",
            },
            -- 在图标后显示来源名称（[LSP] [Buffer] 等）
            before = function(entry, vim_item)
              vim_item.menu = ({
                nvim_lsp = "[LSP]",
                luasnip  = "[Snip]",
                buffer   = "[Buf]",
                path     = "[Path]",
              })[entry.source.name]
              return vim_item
            end,
          }),
        },
      })

      -- ── 命令行补全 ────────────────────────────
      -- 在 : 命令行中也启用补全
      cmp.setup.cmdline(":", {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({
          { name = "path" },    -- 命令行中的路径补全
          { name = "cmdline" }, -- 命令补全
        }),
      })

      -- 在 / 搜索中也启用补全
      cmp.setup.cmdline("/", {
        mapping = cmp.mapping.preset.cmdline(),
        sources = { { name = "buffer" } },
      })
    end,
  },
}
