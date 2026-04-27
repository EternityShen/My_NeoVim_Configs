 -- ─────────────────────────────────────────────
  -- 6. 键位提示：which-key
  -- ─────────────────────────────────────────────
  -- 当你按下 leader 键后，弹出可用快捷键列表（防止忘记快捷键）
  -- 修改 which-key 插件的配置
return {
    "folke/which-key.nvim",
    event = "VeryLazy",
    config = function()
      local wk = require("which-key")
      wk.setup()
      
      -- 使用官方最新的配置方式
      wk.add({
        -- 基础键映射
        { "<C-h>", "<C-w>h", desc = "跳转到左窗口" },
        { "<C-j>", "<C-w>j", desc = "跳转到下窗口" },
        { "<C-k>", "<C-w>k", desc = "跳转到上窗口" },
        { "<C-l>", "<C-w>l", desc = "跳转到右窗口" },

        -- LSP 跳转映射
        { "gd", "<cmd>lua vim.lsp.buf.definition()<cr>", desc = "跳转到定义" },
        { "gD", "<cmd>lua vim.lsp.buf.declaration()<cr>", desc = "跳转到声明" },
        { "gi", "<cmd>lua vim.lsp.buf.implementation()<cr>", desc = "跳转到实现" },
        { "gr", "<cmd>Telescope lsp_references<cr>", desc = "查看所有引用" },
        { "gt", "<cmd>lua vim.lsp.buf.type_definition()<cr>", desc = "跳转到类型定义" },
        { "K", "<cmd>lua vim.lsp.buf.hover()<cr>", desc = "悬浮文档（按两次进入）" },

        -- 诊断信息（错误/警告）
        { "]d", "<cmd>lua vim.diagnostic.goto_next()<cr>", desc = "跳到下一个诊断" },
        { "[d", "<cmd>lua vim.diagnostic.goto_prev()<cr>", desc = "跳到上一个诊断" },

        -- Git hunk 跳转
        { "]h", "<cmd>lua require('gitsigns').next_hunk()<cr>", desc = "下一个 Hunk" },
        { "[h", "<cmd>lua require('gitsigns').prev_hunk()<cr>", desc = "上一个 Hunk" },

        -- Flash 跳转
        { "s", "<cmd>lua require('flash').jump()<cr>", desc = "Flash 跳转" },
        { "S", "<cmd>lua require('flash').treesitter()<cr>", desc = "Flash Treesitter 选择" },

        -- Git 命令
        { "<leader>gs", "<cmd>lua require('gitsigns').stage_hunk()<cr>", desc = "暂存当前 Hunk" },
        { "<leader>gr", "<cmd>lua require('gitsigns').reset_hunk()<cr>", desc = "撤销当前 Hunk" },
        { "<leader>gS", "<cmd>lua require('gitsigns').stage_buffer()<cr>", desc = "暂存整个文件" },
        { "<leader>gR", "<cmd>lua require('gitsigns').reset_buffer()<cr>", desc = "撤销整个文件" },
        { "<leader>gu", "<cmd>lua require('gitsigns').undo_stage_hunk()<cr>", desc = "取消暂存当前 Hunk" },
        { "<leader>gp", "<cmd>lua require('gitsigns').preview_hunk()<cr>", desc = "预览 Hunk" },
        { "<leader>gB", "<cmd>lua require('gitsigns').blame_line({ full = true })<cr>", desc = "显示完整 Blame" },
        { "<leader>gd", "<cmd>lua require('gitsigns').diffthis()<cr>", desc = "与 HEAD 对比" },
        { "<leader>gD", "<cmd>lua require('gitsigns').diffthis('~')<cr>", desc = "与上一次提交对比" },

        -- z开头的命令（折叠和拼写）
        { "z", group = "折叠/拼写" },
        { "za", "在文件中显示当前行", desc = "显示当前行" },
        { "zb", "在文件底部显示当前行", desc = "底部显示当前行" },
        { "zc", "关闭当前折叠", desc = "关闭折叠" },
        { "zd", "删除当前折叠", desc = "删除折叠" },
        { "ze", "切换光标下的折叠", desc = "切换折叠" },
        { "zf", "向右折叠", desc = "向右折叠" },
        { "zh", "半屏向左", desc = "半屏向左" },
        { "zl", "半屏向右", desc = "半屏向右" },
        { "zm", "创建折叠", desc = "创建折叠" },
        { "zo", "打开当前折叠", desc = "打开折叠" },
        { "zr", "打开所有折叠", desc = "打开所有折叠" },
        { "zs", "打开所有折叠", desc = "打开所有折叠" },
        { "zt", "顶部显示当前行", desc = "顶部显示当前行" },
        { "zv", "标记单词为拼写错误", desc = "标记拼写错误" },
        { "zx", "关闭所有折叠", desc = "关闭所有折叠" },
        { "zz", "关闭所有折叠", desc = "关闭所有折叠" },

        -- Telescope 键映射
        { "<leader>f", group = "查找 (Telescope)" },
        { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "查找文件" },
        { "<leader>fr", "<cmd>Telescope oldfiles<cr>", desc = "最近打开的文件" },
        { "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "查找已打开的 Buffer" },
        { "<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "全局内容搜索 (grep)" },
        { "<leader>fw", "<cmd>Telescope grep_string<cr>", desc = "搜索光标下的单词" },
        { "<leader>fh", "<cmd>Telescope help_tags<cr>", desc = "搜索帮助文档" },
        { "<leader>fk", "<cmd>Telescope keymaps<cr>", desc = "搜索快捷键" },
        { "<leader>fc", "<cmd>Telescope commands<cr>", desc = "搜索命令" },
        { "<leader>fd", "<cmd>Telescope diagnostics<cr>", desc = "搜索 LSP 诊断信息" },
        { "<leader>fs", "<cmd>Telescope lsp_document_symbols<cr>", desc = "搜索文件符号" },
        { "<leader>fS", "<cmd>Telescope lsp_workspace_symbols<cr>", desc = "搜索工作区符号" },

        -- Git 键映射
        { "<leader>g", group = "Git" },
        { "<leader>gc", "<cmd>Telescope git_commits<cr>", desc = "搜索 git commits" },
        { "<leader>gb", "<cmd>Telescope git_branches<cr>", desc = "搜索 git 分支" },
        { "<leader>gg", "<cmd>LazyGit<cr>", desc = "打开 LazyGit" },

        -- LSP 键映射
        { "<leader>l", group = "LSP" },
        { "<leader>li", "<cmd>lua vim.lsp.buf.incoming_calls()<cr>", desc = "查看调用者" },
        { "<leader>lr", "<cmd>lua vim.lsp.buf.rename()<cr>", desc = "重命名变量" },
        { "<leader>la", "<cmd>lua vim.lsp.buf.code_action()<cr>", desc = "代码动作（修复建议）" },
        { "<leader>ld", "<cmd>lua vim.diagnostic.open_float()<cr>", desc = "查看当前行诊断详情" },
        { "<leader>lf", "<cmd>lua vim.lsp.buf.format({ async = true })<cr>", desc = "格式化代码" },

        -- 终端和标签页
        { "<leader>t", group = "终端 / Tab" },
        { "<leader>tt", "<cmd>ToggleTerm<cr>", desc = "打开/关闭终端" },
        { "<leader>tn", "<cmd>tabnew<cr>", desc = "新建 Tab" },
        { "<leader>tc", "<cmd>tabclose<cr>", desc = "关闭 Tab" },

        -- 文件树
        { "<leader>e", "<cmd>NvimTreeToggle<cr>", desc = "切换文件树" },
        { "<leader>E", "<cmd>NvimTreeFindFile<cr>", desc = "在文件树中定位当前文件" },

        -- 保存和退出
        { "<leader>w", "<cmd>w<cr>", desc = "保存文件" },
        { "<leader>q", "<cmd>q<cr>", desc = "退出" },
        { "<leader>Q", "<cmd>qa<cr>", desc = "全部保存退出" },

        -- 窗口操作
        { "<leader>s", group = "窗口操作" },
        { "<leader>sv", "<cmd>vsplit<cr>", desc = "垂直分割窗口" },
        { "<leader>sh", "<cmd>split<cr>", desc = "水平分割窗口" },
        { "<leader>sq", "<cmd>close<cr>", desc = "关闭窗口" },

        -- 缓冲区操作
        { "<leader>b", group = "缓冲区" },
        { "<leader>bc", "<cmd>lua require('bufferline').close_current()<cr>", desc = "智能关闭buffer" },
        { "<leader>bo", "<cmd>BufferLineCloseOthers<cr>", desc = "关闭其他buffer" },
        { "<leader>bu", "<cmd>BufferLineCloseLeft<cr>", desc = "关闭左侧buffer" },
        { "<leader>br", "<cmd>BufferLineCloseRight<cr>", desc = "关闭右侧buffer" },
        { "<leader>bh", "<cmd>BufferLineMovePrev<cr>", desc = "向左移动buffer" },
        { "<leader>bl", "<cmd>BufferLineMoveNext<cr>", desc = "向右移动buffer" },
      })
    end,
  }