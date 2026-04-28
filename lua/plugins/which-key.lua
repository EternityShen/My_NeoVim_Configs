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
        { "<C-h>", desc = "跳转到左窗口" },
        { "<C-j>", desc = "跳转到下窗口" },
        { "<C-k>", desc = "跳转到上窗口" },
        { "<C-l>", desc = "跳转到右窗口" },

        -- LSP 跳转映射
        { "gd", desc = "跳转到定义" },
        { "gD", desc = "跳转到声明" },
        { "gi", desc = "跳转到实现" },
        { "gr", desc = "查看所有引用" },
        { "gt", desc = "跳转到类型定义" },
        { "K", desc = "悬浮文档（按两次进入）" },

        -- 诊断信息（错误/警告）
        { "]d", desc = "跳到下一个诊断" },
        { "[d", desc = "跳到上一个诊断" },

        -- Git hunk 跳转
        { "]h", desc = "下一个 Hunk" },
        { "[h", desc = "上一个 Hunk" },

        -- Flash 跳转
        { "s", desc = "Flash 跳转" },
        { "S", desc = "Flash Treesitter 选择" },

        -- Git 命令
        { "<leader>gs", desc = "暂存当前 Hunk" },
        { "<leader>gr", desc = "撤销当前 Hunk" },
        { "<leader>gS", desc = "暂存整个文件" },
        { "<leader>gR", desc = "撤销整个文件" },
        { "<leader>gu", desc = "取消暂存当前 Hunk" },
        { "<leader>gp", desc = "预览 Hunk" },
        { "<leader>gB", desc = "显示完整 Blame" },
        { "<leader>gd", desc = "与 HEAD 对比" },
        { "<leader>gD", desc = "与上一次提交对比" },

        -- z开头的命令（折叠和拼写）
        { "z", group = "折叠/拼写" },
        { "zc", desc = "关闭当前折叠" },
        { "zo", desc = "打开当前折叠" },
        { "za", desc = "切换折叠" },
        { "zm", desc = "创建折叠" },
        { "zr", desc = "打开所有折叠" },
        { "zx", desc = "关闭所有折叠" },
        { "zv", desc = "显示当前行" },
        { "zt", desc = "顶部显示当前行" },
        { "zb", desc = "底部显示当前行" },

        -- Telescope 键映射
        { "<leader>f", group = "查找 (Telescope)" },
        { "<leader>ff", desc = "查找文件" },
        { "<leader>fr", desc = "最近打开的文件" },
        { "<leader>fb", desc = "查找已打开的 Buffer" },
        { "<leader>fg", desc = "全局内容搜索 (grep)" },
        { "<leader>fw", desc = "搜索光标下的单词" },
        { "<leader>fh", desc = "搜索帮助文档" },
        { "<leader>fk", desc = "搜索快捷键" },
        { "<leader>fc", desc = "搜索命令" },
        { "<leader>fd", desc = "搜索 LSP 诊断信息" },
        { "<leader>fs", desc = "搜索文件符号" },
        { "<leader>fS", desc = "搜索工作区符号" },

        -- Git 键映射
        { "<leader>g", group = "Git" },
        { "<leader>gc", desc = "搜索 git commits" },
        { "<leader>gb", desc = "搜索 git 分支" },
        { "<leader>gg", desc = "打开 LazyGit" },

        -- LSP 键映射
        { "<leader>l", group = "LSP" },
        { "<leader>li", desc = "查看调用者" },
        { "<leader>lr", desc = "重命名变量" },
        { "<leader>la", desc = "代码动作（修复建议）" },
        { "<leader>ld", desc = "查看当前行诊断详情" },
        { "<leader>lf", desc = "格式化代码" },

        -- 终端和标签页
        { "<leader>t", group = "终端 / Tab" },
        { "<leader>tt", desc = "打开/关闭终端" },
        { "<leader>tn", desc = "新建 Tab" },
        { "<leader>tc", desc = "关闭 Tab" },

        -- 文件树
        { "<leader>e", desc = "切换文件树" },
        { "<leader>E", desc = "在文件树中定位当前文件" },

        -- 保存和退出
        { "<leader>w", desc = "保存文件" },
        { "<leader>q", desc = "退出" },
        { "<leader>Q", desc = "全部保存退出" },

        -- 窗口操作
        { "<leader>s", group = "窗口操作" },
        { "<leader>sv", desc = "垂直分割窗口" },
        { "<leader>sh", desc = "水平分割窗口" },
        { "<leader>sq", desc = "关闭窗口" },

        -- 缓冲区操作
        { "<leader>b", group = "缓冲区" },
        { "<leader>bc", desc = "智能关闭buffer" },
        { "<leader>bo", desc = "关闭其他buffer" },
        { "<leader>bu", desc = "关闭左侧buffer" },
        { "<leader>br", desc = "关闭右侧buffer" },
        { "<leader>bh", desc = "向左移动buffer" },
        { "<leader>bl", desc = "向右移动buffer" },
      })
    end,
  }
