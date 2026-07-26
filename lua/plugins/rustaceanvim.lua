return {
  -- rustaceanvim: Rust 开发增强插件
  "mrcjkb/rustaceanvim",

  ft = { "rust" },

  dependencies = {
    "neovim/nvim-lspconfig",
    "nvim-lua/plenary.nvim",
    "mfussenegger/nvim-dap",
  },

  opts = {
    server = {
      standalone = true,
      -- settings = {
      --   ["rust-analyzer"] = {
      --     checkOnSave = {
      --       command = "check",
      --     },
      --     cargo = {
      --       buildScripts = {
      --         enable = true,
      --       },
      --     },
      --   },
      -- },
    },
  },

  config = function(_, opts)
    vim.g.rustaceanvim = opts
  end,
}
