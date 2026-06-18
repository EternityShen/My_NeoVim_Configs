local kind_icons = {
  Text          = "",
  Method        = "",
  Function      = "",
  Constructor   = "",
  Field         = "",
  Variable      = "",
  Class         = "",
  Interface     = "",
  Module        = "",
  Property      = "",
  Unit          = "",
  Value         = "",
  Enum          = "",
  Keyword       = "",
  Snippet       = "",
  Color         = "",
  File          = "",
  Reference     = "",
  Folder        = "",
  EnumMember    = "",
  Constant      = "",
  Struct        = "",
  Event         = "",
  Operator      = "",
  TypeParameter = "",
}

local source_labels = {
  nvim_lsp = "LSP",
  luasnip  = "Snip",
  buffer   = "Buf",
  path     = "Path",
  cmdline  = "Cmd",
}

local function apply_highlights()
  vim.api.nvim_set_hl(0, "CmpNormal",                { link = "NormalFloat" })
  vim.api.nvim_set_hl(0, "CmpBorder",                { fg = "#89b4fa" })
  vim.api.nvim_set_hl(0, "CmpSel",                   { bg = "#313244", bold = true })
  vim.api.nvim_set_hl(0, "CmpDocNormal",             { link = "NormalFloat" })
  vim.api.nvim_set_hl(0, "CmpDocBorder",             { fg = "#a6e3a1" })
  vim.api.nvim_set_hl(0, "CmpItemAbbrMatch",         { fg = "#89b4fa", bold = true })
  vim.api.nvim_set_hl(0, "CmpItemAbbrMatchFuzzy",    { fg = "#89dceb", bold = true })
  vim.api.nvim_set_hl(0, "CmpItemKindSnippet",       { fg = "#cba6f7" })
  vim.api.nvim_set_hl(0, "CmpItemKindKeyword",       { fg = "#f38ba8" })
  vim.api.nvim_set_hl(0, "CmpItemKindText",          { fg = "#cdd6f4" })
  vim.api.nvim_set_hl(0, "CmpItemKindFunction",      { fg = "#89b4fa" })
  vim.api.nvim_set_hl(0, "CmpItemKindMethod",        { fg = "#89b4fa" })
  vim.api.nvim_set_hl(0, "CmpItemKindConstructor",   { fg = "#89b4fa" })
  vim.api.nvim_set_hl(0, "CmpItemKindVariable",      { fg = "#cdd6f4" })
  vim.api.nvim_set_hl(0, "CmpItemKindField",         { fg = "#cdd6f4" })
  vim.api.nvim_set_hl(0, "CmpItemKindClass",         { fg = "#fab387" })
  vim.api.nvim_set_hl(0, "CmpItemKindInterface",     { fg = "#fab387" })
  vim.api.nvim_set_hl(0, "CmpItemKindStruct",        { fg = "#fab387" })
  vim.api.nvim_set_hl(0, "CmpItemKindModule",        { fg = "#a6e3a1" })
  vim.api.nvim_set_hl(0, "CmpItemKindProperty",      { fg = "#cdd6f4" })
  vim.api.nvim_set_hl(0, "CmpItemKindEnum",          { fg = "#fab387" })
  vim.api.nvim_set_hl(0, "CmpItemKindEnumMember",    { fg = "#f9e2af" })
  vim.api.nvim_set_hl(0, "CmpItemKindConstant",      { fg = "#f9e2af" })
  vim.api.nvim_set_hl(0, "CmpItemKindValue",         { fg = "#f9e2af" })
  vim.api.nvim_set_hl(0, "CmpItemKindOperator",      { fg = "#cdd6f4" })
  vim.api.nvim_set_hl(0, "CmpItemKindTypeParameter", { fg = "#89dceb" })
  vim.api.nvim_set_hl(0, "CmpItemKindReference",     { fg = "#f38ba8" })
  vim.api.nvim_set_hl(0, "CmpItemKindEvent",         { fg = "#f38ba8" })
  vim.api.nvim_set_hl(0, "CmpItemKindColor",         { fg = "#f5c2e7" })
  vim.api.nvim_set_hl(0, "CmpItemKindFile",          { fg = "#a6e3a1" })
  vim.api.nvim_set_hl(0, "CmpItemKindFolder",        { fg = "#a6e3a1" })
  vim.api.nvim_set_hl(0, "CmpItemKindUnit",          { fg = "#f9e2af" })
  vim.api.nvim_set_hl(0, "CmpItemMenu",              { fg = "#6c7086", italic = true })
end

return {

  -- LuaSnip: Lua 代码片段引擎
  {
    "L3MON4D3/LuaSnip",
    version = "v2.*",
    build = "make install_jsregexp",
    dependencies = { "rafamadriz/friendly-snippets" },
    config = function()
      require("luasnip.loaders.from_vscode").lazy_load()
    end,
  },

  -- nvim-cmp: 自动补全插件
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "L3MON4D3/LuaSnip",
      "saadparwaiz1/cmp_luasnip",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline",
      "onsails/lspkind.nvim",
    },
    config = function()
      local cmp     = require("cmp")
      local luasnip = require("luasnip")
      local lspkind = require("lspkind")

      lspkind.init({
        mode       = "symbol_text",
        preset     = "default",
        symbol_map = kind_icons,
      })

      apply_highlights()
      vim.api.nvim_create_autocmd("ColorScheme", {
        pattern  = "*",
        callback = apply_highlights,
      })

      cmp.setup({

        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },

        window = {
          completion = cmp.config.window.bordered({
            winhighlight = "Normal:CmpNormal,FloatBorder:CmpBorder,CursorLine:CmpSel,Search:None",
            scrollbar    = true,
            scrollbar_pad = 1,
            col_offset   = -1,
            side_padding = 1,
            border       = "rounded",
            zindex       = 1001,
          }),
          documentation = cmp.config.window.bordered({
            winhighlight = "Normal:CmpDocNormal,FloatBorder:CmpDocBorder",
            scrollbar    = true,
            scrollbar_pad = 1,
            max_width    = 70,
            max_height   = 25,
            border       = "rounded",
            zindex       = 1000,
          }),
        },

        mapping = require("config.keymaps").cmp_mappings(),

        sources = cmp.config.sources({
          { name = "luasnip",  priority = 800 },
          { name = "nvim_lsp", priority = 1000 },
          { name = "buffer",   priority = 500  },
          { name = "path",     priority = 250  },
        }),

        sorting = {
          priority_weight = 2,
          comparators = {
            cmp.config.compare.offset,
            cmp.config.compare.exact,
            cmp.config.compare.score,
            cmp.config.compare.recently_used,
            cmp.config.compare.locality,
            cmp.config.compare.kind,
            cmp.config.compare.length,
            cmp.config.compare.order,
          },
        },

        formatting = {
          fields = { "kind", "abbr", "menu" },
          format = function(entry, vim_item)
            local kind_name = vim_item.kind or ""
            local icon      = kind_icons[kind_name] or "?"

            vim_item.kind = " " .. icon .. " "

            local src = source_labels[entry.source.name] or entry.source.name
            vim_item.menu = ("  [%-8s] <%s>"):format(kind_name, src)

            local label = vim_item.abbr
            if #label > 40 then
              vim_item.abbr = label:sub(1, 39) .. "..."
            end

            return vim_item
          end,
        },

        experimental = {
          ghost_text = { hl_group = "Comment" },
        },
      })

      cmp.setup.cmdline(":", {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({
          { name = "path"    },
          { name = "cmdline" },
        }),
      })

      cmp.setup.cmdline("/", {
        mapping = cmp.mapping.preset.cmdline(),
        sources = { { name = "buffer" } },
      })
    end,
  },
}
