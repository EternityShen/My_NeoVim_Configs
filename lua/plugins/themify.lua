return {
  -- themify.nvim: 主题管理器插件
  "LmanTW/themify.nvim",
  lazy = false,
  priority = 1000,
  dependencies = {
    -- 1. Catppuccin: 强化粉色/火烈鸟色高亮，开启透明
    {
      "catppuccin/nvim",
      name = "catppuccin",
      opts = {
        flavour = "mocha",
        transparent_background = true,
        styles = {
          comments = { "italic" },
          conditionals = { "italic" },
        },
        color_overrides = {
          mocha = {
            -- 稍微加深/提亮粉色系配色
            pink = "#f5c2e7",
            flamingo = "#f2cdcd",
            rosewater = "#f5e0dc",
          },
        },
      },
    },
    -- 2. Cyberdream: 官方支持的高饱和赛博粉紫
    {
      "scottmckendry/cyberdream.nvim",
      opts = {
        transparent = true,
        italic_comments = true,
      },
    },
    -- 3. Rose Pine: 经典暗黑玫瑰粉
    {
      "rose-pine/neovim",
      name = "rose-pine",
      opts = {
        variant = "main", -- main 模式的粉紫感最浓
        styles = {
          bold = true,
          italic = true,
          transparency = true,
        },
      },
    },
    -- 4. Tokyo Dark: 极其炫酷的深色荧光粉
    { "tiagovla/tokyodark.nvim" },
  },
  config = function()
    require("themify").setup({
      -- 🌸 粉色 / 霓虹粉 主打推荐列表 🌸
      "catppuccin/nvim",               -- 猫咪粉/火烈鸟粉（配合 opts 调校）
      "avoonix/pink-as-fox.nvim",      -- 纯正粉狐狸（你列表中已有的粉色天花板）
      "tiagovla/tokyodark.nvim",       -- 赛博荧光粉
      "rose-pine/neovim",              -- 暗黑玫瑰粉
      "scottmckendry/cyberdream.nvim", -- 霓虹赛博粉紫

      -- 其他高质量备选
      "EdenEast/nightfox.nvim", -- 切到 duskfox 模式也是满满粉紫感
      "sponkurtus2/angelic.nvim",
      "daltonmenezes/aura-theme",
      "rijulpaul/nightblossom.nvim",
      "folke/tokyonight.nvim",
      "rebelot/kanagawa.nvim",

      -- 配置项
      activity = {
        enabled = true,
      },
      livePreview = true,
    })
  end,
}
