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
    event = "VeryLazy",              -- VeryLazy: 等其他插件加载完成后再加载（不影响启动速度）
    dependencies = {
      "nvim-tree/nvim-web-devicons", -- 文件类型图标（需要 Nerd Font）
    },
    opts = {
      options = {
        theme = "catppuccin",       -- 使用与主题匹配的配色
        component_separators = "|", -- 组件间的分隔符
        section_separators = "",    -- 区域间的分隔符（空字符串=无分隔图标）
        globalstatus = true,        -- 所有窗口共用一个状态栏（Neovim 0.7+ 支持）
      },
      sections = {
        -- 状态栏左侧内容（从左到右）
        lualine_a = { "mode" }, -- 当前模式（NORMAL/INSERT/VISUAL 等）
        lualine_b = { "branch", "diff", "diagnostics" },
        -- branch: git 分支名
        -- diff: 文件修改统计（+新增 ~修改 -删除）
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
    dependencies = { "nvim-tree/nvim-web-devicons" },
    event = "UIEnter",
    config = function()
      require("bufferline").setup({
        options = {
          mode = "buffers",              -- 显示 buffer（也可设为 "tabs" 显示标签页）
          numbers = "none",              -- buffer 编号不显示
          close_command = "bdelete! %d", -- 点击 x 关闭 buffer
          diagnostics = "nvim_lsp",      -- 在 buffer 标签上显示 LSP 错误图标
          diagnostics_indicator = function(count, level)
            local icon = level:match("error") and " " or " "
            return " " .. icon .. count
          end,
          offsets = {
            {
              filetype = "NvimTree", -- 有 nvim-tree 时，bufferline 向右偏移
              text = "ShenEternity 文件树  OvO",
              highlight = "Directory",
              text_align = "left",
            },
          },
          show_buffer_close_icons = true,
          show_close_icon = false,
          separator_style = "slant", -- 可选 "slant" | "thick" | "thin"
        },
      })
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
      max_width = 50,     -- 通知弹窗最大宽度
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
  -- 6. 键位提示：which-key
  -- ─────────────────────────────────────────────
  -- 当你按下 leader 键后，弹出可用快捷键列表（防止忘记快捷键）
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
      delay = 500,       -- 按键后等待 500ms 再显示提示（太快会干扰正常操作）
      preset = "modern", -- 界面风格（classic/modern/helix）
    },
    config = function(_, opts)
      local wk = require("which-key")
      wk.setup(opts)
      -- 注册快捷键分组名称（显示在提示面板里）
      wk.add({
        { "<leader>f", group = "查找 (Telescope)" },
        { "<leader>g", group = "Git" },
        { "<leader>l", group = "LSP" },
        { "<leader>t", group = "终端 / Tab" },
        { "<leader>x", group = "诊断列表" },
        { "<leader>b", group = "Buffer" },
      })
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
          { icon = "  ", key = "f", desc = " 查找文件f", action = "Telescope find_files" },
          { icon = "  ", key = "r", desc = " 最近文件r", action = "Telescope oldfiles" },
          { icon = "  ", key = "g", desc = " 全局搜索g", action = "Telescope live_grep" },
          { icon = "  ", key = "c", desc = " 打开配置c", action = "edit ~/.config/nvim/init.lua" },
          { icon = "  ", key = "l", desc = " 插件管理l", action = "Lazy" },
          { icon = "   󰩈 ", key = "q", desc = " 退出q", action = "qa" },
        },
        footer = { "🚀 快乐编码！" }, -- 底部文字
      },
    },
  },
  -- 命令行美化
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {
      -- add any options here
    },
    dependencies = {
      -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
      "MunifTanjim/nui.nvim",
      -- OPTIONAL:
      --   `nvim-notify` is only needed, if you want to use the notification view.
      --   If not available, we use `mini` as the fallback
      "rcarriga/nvim-notify",
    }
  }
}
