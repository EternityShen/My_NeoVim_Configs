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
        globalstatus = false,       -- 所有窗口共用一个状态栏（Neovim 0.7+ 支持

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
  -- 6. 键位提示：which-key
  -- ─────────────────────────────────────────────
  -- 当你按下 leader 键后，弹出可用快捷键列表（防止忘记快捷键）
  -- 修改 which-key 插件的配置
  {
    "folke/which-key.nvim",
    event = "VeryLazy", -- 延迟加载，确保所有插件都已加载
    config = function()
      local wk = require("which-key")

      -- 配置 which-key 显示中文
      local wk_opts = {
        delay = 500, -- 按键后等待 500ms 再显示提示（太快会干扰正常操作）
        preset = "modern", -- 界面风格（classic/modern/helix）
        icons = {
          breadcrumb = "»", -- 面包屑图标
          separator = "➜", -- 分隔符图标
          group = "+", -- 分组图标
        },
        -- 确保使用中文显示
        window = {
          border = "rounded",       -- 窗口边框
          position = "bottom",      -- 显示位置
          margin = { 1, 0, 1, 0 },  -- 边距
          padding = { 2, 2, 2, 2 }, -- 内边距
        },
        -- 忽略 vim 默认键映射，只显示我们自定义的键映射
        ignore = {
          filetypes = { "TelescopePrompt" },
        },
        -- 显示所有键映射，包括非leader键开头的
        show_help = true,
        show_keys = true,
        -- 配置按键序列的超时时间
        timeout = 1000,
      }

      wk.setup(wk_opts)

      -- 手动注册所有插件键映射
      wk.register({
        -- 基础键映射
        ["<C-h>"] = { "<C-w>h", "跳转到左窗口" },
        ["<C-j>"] = { "<C-w>j", "跳转到下窗口" },
        ["<C-k>"] = { "<C-w>k", "跳转到上窗口" },
        ["<C-l>"] = { "<C-w>l", "跳转到右窗口" },

        -- LSP 跳转映射
        ["gd"] = { "<cmd>lua vim.lsp.buf.definition()<cr>", "跳转到定义" },
        ["gD"] = { "<cmd>lua vim.lsp.buf.declaration()<cr>", "跳转到声明" },
        ["gi"] = { "<cmd>lua vim.lsp.buf.implementation()<cr>", "跳转到实现" },
        ["gr"] = { "<cmd>Telescope lsp_references<cr>", "查看所有引用" },
        ["gt"] = { "<cmd>lua vim.lsp.buf.type_definition()<cr>", "跳转到类型定义" },
        ["K"] = { "<cmd>lua vim.lsp.buf.hover()<cr>", "悬浮文档（按两次进入）" },
        -- ["<C-k>"] = { "<cmd>lua vim.lsp.buf.signature_help()<cr>", "函数签名帮助" },

        -- 诊断信息（错误/警告）
        ["]d"] = { "<cmd>lua vim.diagnostic.goto_next()<cr>", "跳到下一个诊断" },
        ["[d"] = { "<cmd>lua vim.diagnostic.goto_prev()<cr>", "跳到上一个诊断" },

        -- Git hunk 跳转
        ["]h"] = { "<cmd>lua require('gitsigns').next_hunk()<cr>", "下一个 Hunk" },
        ["[h"] = { "<cmd>lua require('gitsigns').prev_hunk()<cr>", "上一个 Hunk" },

        -- Flash 跳转
        ["s"] = { "<cmd>lua require('flash').jump()<cr>", "Flash 跳转" },
        ["S"] = { "<cmd>lua require('flash').treesitter()<cr>", "Flash Treesitter 选择" },

        -- Git 命令
        ["<leader>gs"] = { "<cmd>lua require('gitsigns').stage_hunk()<cr>", "暂存当前 Hunk" },
        ["<leader>gr"] = { "<cmd>lua require('gitsigns').reset_hunk()<cr>", "撤销当前 Hunk" },
        ["<leader>gS"] = { "<cmd>lua require('gitsigns').stage_buffer()<cr>", "暂存整个文件" },
        ["<leader>gR"] = { "<cmd>lua require('gitsigns').reset_buffer()<cr>", "撤销整个文件" },
        ["<leader>gu"] = { "<cmd>lua require('gitsigns').undo_stage_hunk()<cr>", "取消暂存当前 Hunk" },
        ["<leader>gp"] = { "<cmd>lua require('gitsigns').preview_hunk()<cr>", "预览 Hunk" },
        ["<leader>gb"] = { "<cmd>lua require('gitsigns').blame_line({ full = true })<cr>", "显示完整 Blame" },
        ["<leader>gd"] = { "<cmd>lua require('gitsigns').diffthis()<cr>", "与 HEAD 对比" },
        ["<leader>gD"] = { "<cmd>lua require('gitsigns').diffthis('~')<cr>", "与上一次提交对比" },
        
        -- 常用 vim 命令的中文描述
        ["g"] = {
          name = "跳转/查找",
          ["f"] = { "查找并移动到光标后的字符", "查找字符" },
          ["F"] = { "查找并移动到光标前的字符", "反向查找字符" },
          ["t"] = { "查找并移动到光标后字符的前一个位置", "查找并停在字符前" },
          ["T"] = { "查找并移动到光标前字符的后一个位置", "反向查找并停在字符后" },
          ["/"] = { "搜索", "搜索" },
          ["?"] = { "反向搜索", "反向搜索" },
          ["e"] = { "移动到单词末尾", "单词末尾" },
          ["E"] = { "移动到单词末尾（跳过标点）", "单词末尾（跳过标点）" },
          ["^"] = { "移动到行首第一个非空白字符", "行首非空白字符" },
          ["_"] = { "移动到行首第一个非空白字符", "行首非空白字符" },
          ["$"] = { "移动到行尾", "行尾" },
          ["0"] = { "移动到行首", "行首" },
          ["gg"] = { "移动到文件开头", "文件开头" },
          ["G"] = { "移动到文件末尾", "文件末尾" },
        },
        
        -- 其他常用命令
        ["d"] = {
          name = "删除",
          ["d"] = { "删除当前行", "删除行" },
          ["w"] = { "删除到下一个单词开头", "删除到单词开头" },
          ["e"] = { "删除到下一个单词末尾", "删除到单词末尾" },
          ["b"] = { "删除到上一个单词开头", "删除到单词开头" },
          ["$"] = { "删除到行尾", "删除到行尾" },
          ["0"] = { "删除到行首", "删除到行首" },
        },
        
        ["y"] = {
          name = "复制",
          ["y"] = { "复制当前行", "复制行" },
          ["w"] = { "复制到下一个单词开头", "复制到单词开头" },
          ["e"] = { "复制到下一个单词末尾", "复制到单词末尾" },
          ["b"] = { "复制到上一个单词开头", "复制到单词开头" },
          ["$"] = { "复制到行尾", "复制到行尾" },
          ["0"] = { "复制到行首", "复制到行首" },
        },
        
        ["c"] = {
          name = "修改",
          ["c"] = { "修改当前行", "修改行" },
          ["w"] = { "修改到下一个单词开头", "修改到单词开头" },
          ["e"] = { "修改到下一个单词末尾", "修改到单词末尾" },
          ["b"] = { "修改到上一个单词开头", "修改到单词开头" },
          ["$"] = { "修改到行尾", "修改到行尾" },
          ["0"] = { "修改到行首", "修改到行首" },
        },
        
        -- z开头的命令（折叠和拼写）
        ["z"] = {
          name = "折叠/拼写",
          ["a"] = { "在文件中显示当前行", "显示当前行" },
          ["b"] = { "在文件底部显示当前行", "底部显示当前行" },
          ["c"] = { "关闭当前折叠", "关闭折叠" },
          ["d"] = { "删除当前折叠", "删除折叠" },
          ["e"] = { "切换光标下的折叠", "切换折叠" },
          ["f"] = { "向右折叠", "向右折叠" },
          ["h"] = { "半屏向左", "半屏向左" },
          ["l"] = { "半屏向右", "半屏向右" },
          ["m"] = { "创建折叠", "创建折叠" },
          ["o"] = { "打开当前折叠", "打开折叠" },
          ["r"] = { "打开所有折叠", "打开所有折叠" },
          ["s"] = { "打开所有折叠", "打开所有折叠" },
          ["t"] = { "顶部显示当前行", "顶部显示当前行" },
          ["v"] = { "标记单词为拼写错误", "标记拼写错误" },
          ["x"] = { "关闭所有折叠", "关闭所有折叠" },
          ["z"] = { "关闭所有折叠", "关闭所有折叠" },
        },

        -- Telescope 键映射
        ["<leader>f"] = {
          name = "查找 (Telescope)",
          f = { "<cmd>Telescope find_files<cr>", "查找文件" },
          r = { "<cmd>Telescope oldfiles<cr>", "最近打开的文件" },
          b = { "<cmd>Telescope buffers<cr>", "查找已打开的 Buffer" },
          g = { "<cmd>Telescope live_grep<cr>", "全局内容搜索 (grep)" },
          w = { "<cmd>Telescope grep_string<cr>", "搜索光标下的单词" },
          h = { "<cmd>Telescope help_tags<cr>", "搜索帮助文档" },
          k = { "<cmd>Telescope keymaps<cr>", "搜索快捷键" },
          c = { "<cmd>Telescope commands<cr>", "搜索命令" },
          d = { "<cmd>Telescope diagnostics<cr>", "搜索 LSP 诊断信息" },
          s = { "<cmd>Telescope lsp_document_symbols<cr>", "搜索文件符号" },
          S = { "<cmd>Telescope lsp_workspace_symbols<cr>", "搜索工作区符号" },
        },

        -- Git 键映射
        ["<leader>g"] = {
          name = "Git",
          c = { "<cmd>Telescope git_commits<cr>", "搜索 git commits" },
          b = { "<cmd>Telescope git_branches<cr>", "搜索 git 分支" },
          g = { "<cmd>LazyGit<cr>", "打开 LazyGit" },
        },

        -- LSP 键映射
        ["<leader>l"] = {
          name = "LSP",
          i = { "<cmd>lua vim.lsp.buf.incoming_calls()<cr>", "查看调用者" },
          r = { "<cmd>lua vim.lsp.buf.rename()<cr>", "重命名变量" },
          a = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "代码动作（修复建议）" },
          d = { "<cmd>lua vim.diagnostic.open_float()<cr>", "查看当前行诊断详情" },
          f = { "<cmd>lua vim.lsp.buf.format({ async = true })<cr>", "格式化代码" },
        },

        -- 终端和标签页
        ["<leader>t"] = {
          name = "终端 / Tab",
          t = { "<cmd>ToggleTerm<cr>", "打开/关闭终端" },
          n = { "<cmd>tabnew<cr>", "新建 Tab" },
          c = { "<cmd>tabclose<cr>", "关闭 Tab" },
        },

        -- 文件树
        ["<leader>e"] = { "<cmd>NvimTreeToggle<cr>", "切换文件树" },
        ["<leader>E"] = { "<cmd>NvimTreeFindFile<cr>", "在文件树中定位当前文件" },

        -- 保存和退出
        ["<leader>w"] = { "<cmd>w<cr>", "保存文件" },
        ["<leader>q"] = { "<cmd>q<cr>", "退出" },
        ["<leader>Q"] = { "<cmd>qa<cr>", "全部保存退出" },

        -- 窗口操作
        ["<leader>s"] = {
          name = "窗口操作",
          v = { "<cmd>vsplit<cr>", "垂直分割窗口" },
          h = { "<cmd>split<cr>", "水平分割窗口" },
          q = { "<cmd>close<cr>", "关闭窗口" },
        },

        -- 缓冲区操作
        ["<leader>b"] = {
          name = "缓冲区",
          c = { "<cmd>lua require('bufferline').close_current()<cr>", "智能关闭buffer" },
          o = { "<cmd>BufferLineCloseOthers<cr>", "关闭其他buffer" },
          u = { "<cmd>BufferLineCloseLeft<cr>", "关闭左侧buffer" },
          r = { "<cmd>BufferLineCloseRight<cr>", "关闭右侧buffer" },
          h = { "<cmd>BufferLineMovePrev<cr>", "向左移动buffer" },
          l = { "<cmd>BufferLineMoveNext<cr>", "向右移动buffer" },
        },
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
          { icon = "  ", key = "f", desc = "F-查找文件", action = "Telescope find_files" },
          { icon = "  ", key = "r", desc = "R-最近文件", action = "Telescope oldfiles" },
          { icon = "  ", key = "g", desc = "G-全局搜索", action = "Telescope live_grep" },
          { icon = "  ", key = "c", desc = "C-打开配置", action = "edit ~/.config/nvim/init.lua" },
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
