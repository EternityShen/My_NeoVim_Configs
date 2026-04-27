-- =============================================================================
-- telescope.lua - 模糊搜索插件（堪称 Neovim 最强大的插件之一）
-- =============================================================================

return {
  {
    "nvim-telescope/telescope.nvim",
    cmd = "Telescope",         -- 当输入 :Telescope 命令时才加载
    version = false,           -- 使用最新 commit（Telescope 没有稳定 tag）
    dependencies = {
      "nvim-lua/plenary.nvim", -- Lua 工具库（Telescope 的依赖）
      -- 用 C 重写的模糊搜索算法，搜索速度大幅提升（需要 make 工具）
      {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make", -- 安装时需要编译
        cond = function()
          -- 只在 make 可用时安装（Windows 可能没有 make）
          return vim.fn.executable("make") == 1
        end,
      },
    },
    config = function()
      local telescope = require("telescope")
      local actions = require("telescope.actions")

      telescope.setup({
        defaults = {
          -- 搜索结果的预览窗口样式
          layout_strategy = "horizontal", -- 水平布局（结果在左，预览在右）
          layout_config = {
            horizontal = {
              prompt_position = "top", -- 搜索框在顶部
              preview_width = 0.55,    -- 预览窗口占 55% 宽度
            },
          },
          sorting_strategy = "ascending", -- 结果从上往下排列
          prompt_prefix = "  ",           -- 搜索框前缀图标
          selection_caret = "  ",         -- 选中项的前缀图标
          path_display = { "truncate" },  -- 路径过长时截断显示

          -- 键位映射（在搜索结果界面里）
          mappings = {
            i = {                                          -- 插入模式（在搜索框输入时）
              ["<C-j>"] = actions.move_selection_next,     -- 向下移动选择
              ["<C-k>"] = actions.move_selection_previous, -- 向上移动选择
              ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
              -- 把所有结果发送到 quickfix 列表
              ["<Esc>"] = actions.close, -- Esc 关闭搜索界面
            },
          },

          -- 搜索时忽略这些目录
          file_ignore_patterns = {
            "node_modules", ".git/", "dist/", "build/", "%.lock",
          },
        },

        pickers = {
          -- 查找文件时的设置
          find_files = {
            hidden = true, -- 显示隐藏文件（. 开头的文件）
          },
        },
      })

      -- 加载 fzf 扩展（提升搜索性能）
      pcall(telescope.load_extension, "fzf")

      -- 快捷键配置已迁移到 keymaps.lua
    end,
  },
}
