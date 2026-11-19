-- =============================================================================
-- editor.lua - 编辑器增强插件
-- =============================================================================

return {

  -- ─────────────────────────────────────────────
  -- 1. 文件树：nvim-tree
  -- ─────────────────────────────────────────────
  -- 左侧文件浏览器，类似 VSCode 的文件树
  {
    "nvim-tree/nvim-tree.lua",
    version = "*",  -- 使用最新稳定版
    lazy = false,   -- 立即加载（不懒加载，因为文件树需要随时可用）
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      -- 禁用 netrw（Neovim 内置文件管理器），避免冲突
      vim.g.loaded_netrw = 1
      vim.g.loaded_netrwPlugin = 1

      require("nvim-tree").setup({
        sort_by = "case_sensitive",  -- 文件排序：区分大小写
        view = {
          width = 30,         -- 文件树宽度（字符数）
          side = "left",      -- 显示在左侧
          relativenumber = false,  -- 文件树内不显示相对行号
        },
        renderer = {
          group_empty = true,  -- 将只有一个子目录的空目录合并显示
          icons = {
            show = {
              file = true,       -- 显示文件类型图标
              folder = true,     -- 显示文件夹图标
              folder_arrow = true,  -- 显示折叠箭头
              git = true,        -- 显示 git 状态图标
            },
          },
        },
        filters = {
          dotfiles = false,  -- false = 显示隐藏文件（.gitignore 等）
          custom = { "^.git$" },  -- 隐藏 .git 目录本身（内容太多）
        },
        git = {
          enable = true,   -- 启用 git 集成（显示文件的 git 状态）
          ignore = false,  -- 显示被 .gitignore 忽略的文件
        },
        actions = {
          open_file = {
            quit_on_open = false,  -- 打开文件后不自动关闭文件树
            window_picker = {
              enable = true,  -- 有多个窗口时，提示选择在哪个窗口打开文件
            },
          },
        },
        -- 右键菜单
        on_attach = function(bufnr)
          local api = require("nvim-tree.api")
          -- 先加载默认键位映射
          api.config.mappings.default_on_attach(bufnr)
          -- 可以在这里添加自定义映射
        end,
      })

      -- 快捷键已迁移到 keymaps.lua
    end,
  },

  -- ─────────────────────────────────────────────
  -- 2. 括号自动配对
  -- ─────────────────────────────────────────────
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",  -- 进入插入模式时才加载（节省启动时间）
    opts = {
      check_ts = true,  -- 使用 Treesitter 检查上下文（更智能的配对）
    },
  },

  -- ─────────────────────────────────────────────
  -- 3. 注释快捷键
  -- ─────────────────────────────────────────────
  {
    "numToStr/Comment.nvim",
    event = { "BufReadPre", "BufNewFile" },
    opts = {},  -- 使用默认配置
    -- 默认快捷键：
    -- gcc  → 注释/取消注释当前行
    -- gc   + 移动命令 → 注释多行（如 gc5j 注释下面5行）
    -- 可视模式选中后 gc → 注释选中内容
  },

  -- ─────────────────────────────────────────────
  -- 4. 高亮相同单词
  -- ─────────────────────────────────────────────
  {
    "RRethy/vim-illuminate",
    event = { "BufReadPre", "BufNewFile" },
    opts = {
      delay = 200,  -- 光标停留 200ms 后高亮相同单词
      large_file_cutoff = 2000,  -- 超过 2000 行的文件禁用（性能考虑）
    },
    config = function(_, opts)
      require("illuminate").configure(opts)
    end,
  },

  -- ─────────────────────────────────────────────
  -- 5. 环绕操作：surround
  -- ─────────────────────────────────────────────
  -- 快速添加/修改/删除 括号、引号、标签等包围符号
  {
    "kylechui/nvim-surround",
    event = { "BufReadPre", "BufNewFile" },
    version = "*",
    opts = {},
    -- 常用操作：
    -- ys{移动}{符号}  → 添加包围（ysiw" 给单词加双引号）
    -- cs{旧}{新}      → 替换包围（cs"' 把双引号改成单引号）
    -- ds{符号}        → 删除包围（ds" 删除双引号）
  },

  -- ─────────────────────────────────────────────
  -- 6. 终端集成
  -- ─────────────────────────────────────────────
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    keys = { "<C-\\>" },  -- 只有按这个键时才加载插件
    opts = {
      size = function(term)
        -- 水平终端占屏幕高度 30%，垂直终端占宽度 40%
        if term.direction == "horizontal" then
          return vim.o.lines * 0.3
        elseif term.direction == "vertical" then
          return vim.o.columns * 0.4
        end
      end,
      direction = "float",       -- 默认浮动终端（float/horizontal/vertical）
      float_opts = {
        border = "curved",       -- 浮动终端边框样式
        winblend = 0,            -- 透明度（0=不透明）
      },
      shell = vim.o.shell,       -- 使用系统默认 shell
    },
  },

  -- ─────────────────────────────────────────────
  -- 7. 多光标 / 快速跳转：flash.nvim
  -- ─────────────────────────────────────────────
  {
    "folke/flash.nvim",
    event = "VeryLazy",
    opts = {},

    -- 使用方式：按 s，然后输入要跳转的字符，会显示跳转标签，再按标签字母即跳过去
  },
}
