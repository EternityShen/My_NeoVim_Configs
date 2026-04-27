 -- ─────────────────────────────────────────────
  -- 6. 键位提示：which-key
  -- ─────────────────────────────────────────────
  -- 当你按下 leader 键后，弹出可用快捷键列表（防止忘记快捷键）
  -- 修改 which-key 插件的配置
return {
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
  }