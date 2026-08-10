return {

  -- nvim-tree.lua: 文件树插件
  {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    lazy = false,
    dependencies = { "Mirsmog/real-icons.nvim" },
    config = function()
      vim.g.loaded_netrw = 1
      vim.g.loaded_netrwPlugin = 1

      require("nvim-tree").setup({
        sort_by = "case_sensitive",
        view = {
          width = 30,
          side = "left",
          relativenumber = false,
        },
        renderer = {
          group_empty = true,
          icons = {
            show = {
              file = true,
              folder = true,
              folder_arrow = true,
              git = true,
            },
          },
        },
        filters = {
          dotfiles = false,
          custom = { "^.git$" },
        },
        git = {
          enable = true,
          ignore = false,
        },
        actions = {
          open_file = {
            quit_on_open = false,
            window_picker = {
              enable = true,
            },
          },
        },
        on_attach = function(bufnr)
          local api = require("nvim-tree.api")
          api.config.mappings.default_on_attach(bufnr)
        end,
      })
    end,
  },

  -- nvim-autopairs: 自动括号配对插件
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    opts = {
      check_ts = true,
    },
  },

  -- Comment.nvim: 注释快捷键插件
  {
    "numToStr/Comment.nvim",
    event = { "BufReadPre", "BufNewFile" },
    opts = {},
  },

  -- vim-illuminate: 高亮相同单词插件
  {
    "RRethy/vim-illuminate",
    event = { "BufReadPre", "BufNewFile" },
    opts = {
      delay = 200,
      large_file_cutoff = 2000,
    },
    config = function(_, opts)
      require("illuminate").configure(opts)
    end,
  },

  -- nvim-surround: 环绕操作插件
  {
    "kylechui/nvim-surround",
    event = { "BufReadPre", "BufNewFile" },
    version = "*",
    opts = {},
  },

  -- toggleterm.nvim: 终端集成插件
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    keys = { "<C-\\>" },
    opts = {
      size = function(term)
        if term.direction == "horizontal" then
          return vim.o.lines * 0.3
        elseif term.direction == "vertical" then
          return vim.o.columns * 0.4
        end
      end,
      direction = "float",
      float_opts = {
        border = "curved",
        winblend = 0,
      },
      shell = vim.o.shell,
    },
  },

  -- flash.nvim: 快速跳转插件
  {
    "folke/flash.nvim",
    event = "VeryLazy",
    opts = {},
  },
}
