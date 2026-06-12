return {

  -- catppuccin.nvim: Catppuccin 主题插件
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    opts = {
      flavour = "mocha",
      background = { light = "latte", dark = "mocha" },
      transparent_background = false,
      integrations = {
        cmp = true,
        gitsigns = true,
        nvimtree = true,
        treesitter = true,
        telescope = { enabled = true },
        lsp_trouble = true,
        which_key = true,
        indent_blankline = { enabled = true },
        notify = true,
      },
    },
    config = function(_, opts)
      require("catppuccin").setup(opts)
      vim.cmd.colorscheme("catppuccin")
    end,
  },

  -- lualine.nvim: 状态栏插件
  {
    "nvim-lualine/lualine.nvim",
    event = "VimEnter",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
      "catppuccin/nvim",
    },
    opts = {
      options = {
        component_separators = "|",
        section_separators = "",
        globalstatus = true,

      },
      sections = {
        lualine_a = { "mode" },
        lualine_b = { "branch", "diagnostics" },
        lualine_c = { { "filename", path = 1 } },

        lualine_x = { "encoding", "fileformat", "filetype" },
        lualine_y = { "progress" },
        lualine_z = { "location" },
      },
    },
  },

  -- bufferline.nvim: 标签栏插件
  {
    "akinsho/bufferline.nvim",
    version = "*",
    dependencies = "nvim-tree/nvim-web-devicons",
    config = function()
      local function smart_close()
        if vim.bo.modified then
          vim.cmd.write()
        end

        local current_buf = vim.fn.bufnr()
        local buflisted = vim.fn.getbufinfo({ buflisted = 1 })

        if #buflisted <= 1 then
          vim.cmd("bdelete!")
          vim.cmd("enew")
          return
        end

        local current_idx = 0
        for i, buf in ipairs(buflisted) do
          if buf.bufnr == current_buf then
            current_idx = i
            break
          end
        end

        if current_idx > 0 then
          if current_idx < #buflisted then
            vim.cmd("BufferLineCycleNext")
          else
            vim.cmd("BufferLineCyclePrev")
          end
        end

        vim.cmd("bdelete! " .. current_buf)
      end

      require("bufferline").setup({
        options = {
          mode = "buffers",
          style_preset = require("bufferline").style_preset.default,
          themable = true,
          numbers = "none",
          close_command = smart_close,
          right_mouse_command = smart_close,
          middle_mouse_command = smart_close,
          indicator = {
            style = "icon",
          },
          buffer_close_icon = "󰅖",
          modified_icon = "●",
          close_icon = "",
          left_trunc_marker = "",
          right_trunc_marker = "",
          max_name_length = 18,
          max_prefix_length = 15,
          truncate_names = true,
          tab_size = 18,
          diagnostics = "nvim_lsp",
          diagnostics_update_in_insert = false,
          offsets = {
            {
              filetype = "NvimTree",
              text = "ShenEternity & 文件树",
              highlight = "Directory",
              text_align = "left",
            },
          },
          color_icons = true,
          show_buffer_icons = true,
          show_buffer_close_icons = true,
          show_close_icon = true,
          show_tab_indicators = true,
          persist_buffer_sort = true,
          separator_style = "thin",
          enforce_regular_tabs = false,
          always_show_bufferline = true,
          hover = {
            enabled = true,
            delay = 200,
            reveal = { "close" },
          },
        },
      })

      vim.keymap.set("n", "<leader>bc", smart_close, { desc = "智能关闭buffer" })
      vim.keymap.set("n", "<leader>bo", ":BufferLineCloseOthers<CR>", { desc = "关闭其他buffer" })
      vim.keymap.set("n", "<leader>bl", ":BufferLineCloseLeft<CR>", { desc = "关闭左侧buffer" })
      vim.keymap.set("n", "<leader>br", ":BufferLineCloseRight<CR>", { desc = "关闭右侧buffer" })

      vim.keymap.set("n", "<S-h>", ":BufferLineCyclePrev<CR>", { desc = "上一个buffer" })
      vim.keymap.set("n", "<S-l>", ":BufferLineCycleNext<CR>", { desc = "下一个buffer" })

      vim.keymap.set("n", "<leader>bh", ":BufferLineMovePrev<CR>", { desc = "向左移动buffer" })
      vim.keymap.set("n", "<leader>bl", ":BufferLineMoveNext<CR>", { desc = "向右移动buffer" })
    end,
  },

  -- nvim-notify: 通知美化插件
  {
    "rcarriga/nvim-notify",
    opts = {
      timeout = 3000,
      max_width = 50,
      render = "compact",
      stages = "fade",
    },
    config = function(_, opts)
      local notify = require("notify")
      notify.setup(opts)
      vim.notify = notify
    end,
  },

  -- 一堆美化插件
  {
    "stevearc/dressing.nvim",
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    "nvim-tree/nvim-web-devicons",
    "MeanderingProgrammer/render-markdown.nvim",
  },



  -- dashboard-nvim: 启动界面插件
  {
    "nvimdev/dashboard-nvim",
    event = "VimEnter",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
      theme = "doom",
      config = {
        header = {
          "",
          "  ███████╗██╗  ██╗███████╗███╗   ██╗    ███████╗████████╗███████╗██████╗ ███╗   ██╗██╗████████╗██╗   ██╗",
          "  ██╔════╝██║  ██║██╔════╝████╗  ██║    ██╔════╝╚══██╔══╝██╔════╝██╔══██╗████╗  ██║██║╚══██╔══╝╚██╗ ██╔╝",
          "  ███████╗███████║█████╗  ██╔██╗ ██║    █████╗     ██║   █████╗  ██████╔╝██╔██╗ ██║██║   ██║    ╚████╔╝ ",
          "  ╚════██║██╔══██║██╔══╝  ██║╚██╗██║    ██╔══╝     ██║   ██╔══╝  ██╔══██╗██║╚██╗██║██║   ██║     ╚██╔╝  ",
          "  ███████║██║  ██║███████╗██║ ╚████║    ███████╗   ██║   ███████╗██║  ██║██║ ╚████║██║   ██║      ██║   ",
          "  ╚══════╝╚═╝  ╚═╝╚══════╝╚═╝  ╚═══╝    ╚══════╝   ╚═╝   ╚══════╝╚═╝  ╚═╝╚═╝  ╚═══╝╚═╝   ╚═╝      ╚═╝   ",
          "",
        },
        center = {
          { icon = "  ", key = "f", desc = "F-查找文件", action = "Telescope find_files" },
          { icon = "  ", key = "r", desc = "R-最近文件", action = "Telescope oldfiles" },
          { icon = "  ", key = "G", desc = "G-全局搜索", action = "Telescope live_grep" },
          { icon = "  ", key = "l", desc = "L-插件管理", action = "Lazy" },
          { icon = "   ", key = "q", desc = "OvO-退出", action = "qa" },
        },
        footer = { "   OvO ShenEternity Let's go！" },
      },
    },
  },
  -- noice.nvim: 命令行美化插件
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {
      cmdline = {
        view = "cmdline_popup",
        format = {
          search_down = { icon = " " },
          search_up = { icon = " " },
        },
      },

      messages = {
        enabled = true,
        view = "notify",
        view_error = "notify",
        view_warn = "notify",
        view_history = "messages",
        view_search = "virtualtext",
      },

      popupmenu = {
        enabled = true,
        backend = "nui",
        kind_icons = true,
      },

      views = {
        cmdline_popup = {
          position = {
            row = 2,
            col = "50%",
          },
          size = {
            width = 60,
            height = "auto",
          },
          border = {
            style = "rounded",
            padding = { 0, 1 },
          },
          win_options = {
            winhighlight = {
              Normal = "Normal",
              FloatBorder = "FloatBorder",
            },
          },
        },

        popupmenu = {
          relative = "editor",
          position = {
            row = 8,
            col = "50%",
          },
          size = {
            width = 60,
            height = 10,
          },
          border = {
            style = "rounded",
            padding = { 0, 1 },
          },
          win_options = {
            winhighlight = {
              Normal = "Normal",
              FloatBorder = "FloatBorder",
            },
          },
        },

        notify = {
          position = {
            row = 3,
            col = "50%",
          },
          size = {
            width = 50,
            height = "auto",
          },
          border = {
            style = "rounded",
          },
        },
      },

      routes = {
        {
          view = "cmdline_popup",
          filter = { event = "cmdline", kind = "search" },
        },
        {
          view = "cmdline_popup",
          filter = { event = "cmdline", kind = ":" },
        },
        {
          view = "cmdline_popup",
          filter = { event = "cmdline", kind = "/" },
        },
      },

      presets = {
        bottom_search = false,
        command_palette = true,
        long_message_to_split = true,
        inc_rename = true,
        lsp_doc_border = true,
      },
    },
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    }
  }
}
