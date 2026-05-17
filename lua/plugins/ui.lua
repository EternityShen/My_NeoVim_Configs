-- =============================================================================
-- ui.lua - 界面美化相关插件
-- =============================================================================
-- lazy.nvim 插件规范格式：
-- {
--   "作者/仓库名",          ← GitHub 仓库地址
--   event = "...",          ← 触发加载的事件（懒加载）
--   dependencies = {...},   ← 依赖的其他插件
--   opts = {...},           ← 传给 plugin.setup() 的选项
--   config = function() end ← 自定义初始化函数（比 opts 更灵活）
-- }

return {

  -- ─────────────────────────────────────────────
  -- 1. 颜色主题：Catppuccin
  -- ─────────────────────────────────────────────
  -- 一个温柔的暗色系主题，有4种风格可选
  {
    "catppuccin/nvim",
    name = "catppuccin",              -- 给插件起别名（因为仓库名是 nvim，容易冲突）
    priority = 1000,                  -- 优先级设最高，保证主题最先加载（避免短暂的颜色闪烁）
    opts = {
      flavour = "mocha",              -- 风格选项：latte(浅色)/frappe/macchiato/mocha(最深)
      background = { light = "latte", dark = "mocha" },
      transparent_background = false, -- 是否透明背景（true 则终端背景透明显示）
      integrations = {
        -- 与其他插件的颜色集成
        cmp = true,        -- nvim-cmp 补全菜单
        gitsigns = true,   -- git 符号
        nvimtree = true,   -- 文件树
        treesitter = true, -- 语法高亮
        telescope = { enabled = true },
        lsp_trouble = true,
        which_key = true,
        indent_blankline = { enabled = true },
        notify = true,
      },
    },
    config = function(_, opts)
      require("catppuccin").setup(opts)
      vim.cmd.colorscheme("catppuccin") -- 应用主题
    end,
  },

  -- ─────────────────────────────────────────────
  -- 2. 状态栏：lualine
  -- ─────────────────────────────────────────────
  -- 底部状态栏，显示模式、文件名、git 分支、LSP 错误等信息
  {
    "nvim-lualine/lualine.nvim",
    event = "VimEnter",
    dependencies = {
      "nvim-tree/nvim-web-devicons", -- 文件类型图标（需要 Nerd Font）
      "catppuccin/nvim",             -- 颜色主题（需要加载后生效）
    },
    opts = {
      options = {
        component_separators = "|", -- 组件间的分隔符
        section_separators = "",    -- 区域间的分隔符（空字符串=无分隔图标）
        globalstatus = true,        -- 所有窗口共用一个状态栏（Neovim 0.7+ 支持

      },
      sections = {
        -- 状态栏左侧内容（从左到右）
        lualine_a = { "mode" }, -- 当前模式（NORMAL/INSERT/VISUAL 等）
        lualine_b = { "branch", "diagnostics" },
        -- branch: git 分支名
        -- diagnostics: LSP 错误/警告数量
        lualine_c = { { "filename", path = 1 } },
        -- path=1 显示相对路径（比只显示文件名更清楚）

        -- 状态栏右侧内容
        lualine_x = { "encoding", "fileformat", "filetype" },
        -- encoding: 文件编码（utf-8）
        -- fileformat: 行结束符（unix/dos/mac）
        -- filetype: 文件类型（lua/python 等）
        lualine_y = { "progress" }, -- 光标在文件中的百分比位置
        lualine_z = { "location" }, -- 光标行列号（行:列）
      },
    },
  },

  -- ─────────────────────────────────────────────
  -- 3. 标签栏：bufferline
  -- ─────────────────────────────────────────────
  -- 顶部显示所有打开的 buffer（类似浏览器标签页）
  {
    "akinsho/bufferline.nvim",
    version = "*",
    dependencies = "nvim-tree/nvim-web-devicons",
    config = function()
      local function smart_close()
        -- 保存修改
        if vim.bo.modified then
          vim.cmd.write()
        end

        local current_buf = vim.fn.bufnr()
        local buflisted = vim.fn.getbufinfo({ buflisted = 1 })

        -- 如果只有一个 buffer，直接关闭并创建新文件
        if #buflisted <= 1 then
          vim.cmd("bdelete!")
          vim.cmd("enew")
          return
        end

        -- 查找当前 buffer 的位置
        local current_idx = 0
        for i, buf in ipairs(buflisted) do
          if buf.bufnr == current_buf then
            current_idx = i
            break
          end
        end

        -- 决定切换到哪个 buffer
        if current_idx > 0 then
          if current_idx < #buflisted then
            -- 切换到下一个
            vim.cmd("BufferLineCycleNext")
          else
            -- 切换到上一个
            vim.cmd("BufferLineCyclePrev")
          end
        end

        -- 关闭原 buffer
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

      -- 快捷键映射
      vim.keymap.set("n", "<leader>bc", smart_close, { desc = "智能关闭buffer" })
      vim.keymap.set("n", "<leader>bo", ":BufferLineCloseOthers<CR>", { desc = "关闭其他buffer" })
      vim.keymap.set("n", "<leader>bl", ":BufferLineCloseLeft<CR>", { desc = "关闭左侧buffer" })
      vim.keymap.set("n", "<leader>br", ":BufferLineCloseRight<CR>", { desc = "关闭右侧buffer" })

      -- 切换 buffer
      vim.keymap.set("n", "<S-h>", ":BufferLineCyclePrev<CR>", { desc = "上一个buffer" })
      vim.keymap.set("n", "<S-l>", ":BufferLineCycleNext<CR>", { desc = "下一个buffer" })

      -- 移动 buffer
      vim.keymap.set("n", "<leader>bh", ":BufferLineMovePrev<CR>", { desc = "向左移动buffer" })
      vim.keymap.set("n", "<leader>bl", ":BufferLineMoveNext<CR>", { desc = "向右移动buffer" })
    end,
  },

  -- ─────────────────────────────────────────────
  -- 5. 通知美化：nvim-notify
  -- ─────────────────────────────────────────────
  -- 把 vim.notify() 的弹窗变得好看（右上角弹出通知）
  {
    "rcarriga/nvim-notify",
    opts = {
      timeout = 3000,     -- 通知显示 3 秒后自动消失
      max_width = 100,    -- 通知弹窗最大宽度
      render = "compact", -- 样式（default/compact/minimal）
      stages = "fade",    -- 动画效果（fade/slide/fade_in_slide_out/static）
    },
    config = function(_, opts)
      local notify = require("notify")
      notify.setup(opts)
      vim.notify = notify -- 替换 Neovim 默认的通知函数
    end,
  },



  -- ─────────────────────────────────────────────
  -- 7. 启动界面：dashboard
  -- ─────────────────────────────────────────────
  -- 打开 Neovim 时显示欢迎界面（快捷方式、最近文件等）
  {
    "nvimdev/dashboard-nvim",
    event = "VimEnter", -- Neovim 完全启动后加载
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
      theme = "doom", -- 主题（doom/hyper）
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
        center = { -- 快捷按钮列表
          { icon = "  ", key = "f", desc = "F-查找文件", action = "Telescope find_files" },
          { icon = "  ", key = "r", desc = "R-最近文件", action = "Telescope oldfiles" },
          { icon = "  ", key = "G", desc = "G-全局搜索", action = "Telescope live_grep" },
          { icon = "  ", key = "l", desc = "L-插件管理", action = "Lazy" },
          { icon = "   ", key = "q", desc = "OvO-退出", action = "qa" },
        },
        footer = { "   OvO ShenEternity Let's go！" }, -- 底部文字
      },
    },
  },
  -- 命令行美化
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {
      -- 命令行配置
      cmdline = {
        view = "cmdline_popup", -- 使用弹出式命令行
        format = {
          -- 隐藏命令行中的搜索计数
          search_down = { icon = " " },
          search_up = { icon = " " },
        },
      },

      -- 消息配置
      messages = {
        enabled = true,
        view = "notify", -- 使用通知样式
        view_error = "notify",
        view_warn = "notify",
        view_history = "messages",
        view_search = "virtualtext",
      },

      -- 弹出窗口配置
      popupmenu = {
        enabled = true,
        backend = "nui",   -- 使用 nui 后端
        kind_icons = true, -- 显示类型图标
      },

      -- 视图配置
      views = {
        -- 命令行弹出窗口
        cmdline_popup = {
          position = {
            row = 2, -- 从第2行开始（留出状态栏空间）
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

        -- 弹出菜单
        popupmenu = {
          relative = "editor",
          position = {
            row = 8, -- 第8行
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

        -- 通知窗口（也放在上方）
        notify = {
          position = {
            row = 3, -- 第3行
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

      -- 路由配置
      routes = {
        -- 将命令行输出重定向到弹出窗口
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

      -- 预设配置
      presets = {
        bottom_search = false,  -- 禁用底部搜索
        command_palette = true, -- 启用命令面板
        long_message_to_split = true,
        inc_rename = true,      -- 启用增量重命名
        lsp_doc_border = true,  -- LSP文档边框
      },
    },
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    }
  }
}
