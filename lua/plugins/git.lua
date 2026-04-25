-- =============================================================================
-- git.lua - Git 集成插件
-- =============================================================================

return {

  -- ─────────────────────────────────────────────
  -- 1. gitsigns：行号旁显示 git 变更状态
  -- ─────────────────────────────────────────────
  {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPre", "BufNewFile" },
    opts = {
      signs = {
        -- 在行号左侧显示 git 状态
        add          = { text = "│" }, -- 新增行（绿色竖线）
        change       = { text = "│" }, -- 修改行（黄色竖线）
        delete       = { text = "_" }, -- 删除行（红色下划线）
        topdelete    = { text = "‾" }, -- 顶部删除
        changedelete = { text = "~" }, -- 修改+删除
        untracked    = { text = "┆" }, -- 未跟踪文件
      },
      current_line_blame = true, -- 在当前行末显示 git blame 信息（谁最后修改了这行）
      current_line_blame_opts = {
        delay = 1000, -- 停留 1 秒后显示 blame 信息
      },
      on_attach = function(bufnr)
        local gs = package.loaded.gitsigns
        local map = function(mode, l, r, desc)
          vim.keymap.set(mode, l, r, { buffer = bufnr, desc = "Git: " .. desc })
        end

        -- 在 git 修改的 hunk 之间跳转
        map("n", "]h", gs.next_hunk, "下一个 Hunk")
        map("n", "[h", gs.prev_hunk, "上一个 Hunk")

        -- 操作 hunk
        map("n", "<leader>gs", gs.stage_hunk, "暂存当前 Hunk")
        map("n", "<leader>gr", gs.reset_hunk, "撤销当前 Hunk")
        map("n", "<leader>gS", gs.stage_buffer, "暂存整个文件")
        map("n", "<leader>gR", gs.reset_buffer, "撤销整个文件")
        map("n", "<leader>gu", gs.undo_stage_hunk, "取消暂存当前 Hunk")

        -- 预览 hunk（弹出小窗口显示修改内容）
        map("n", "<leader>gp", gs.preview_hunk, "预览 Hunk")

        -- 显示 blame 信息
        map("n", "<leader>gb", function() gs.blame_line({ full = true }) end, "显示完整 Blame")

        -- 比较差异
        map("n", "<leader>gd", gs.diffthis, "与 HEAD 对比")
        map("n", "<leader>gD", function() gs.diffthis("~") end, "与上一次提交对比")
      end,
    },
  },

  -- ─────────────────────────────────────────────
  -- 2. lazygit：在 Neovim 内使用 lazygit TUI
  -- ─────────────────────────────────────────────
  -- 需要先安装 lazygit：brew install lazygit
  {
    "kdheepak/lazygit.nvim",
    cmd = { "LazyGit", "LazyGitCurrentFile" },
    keys = {
      { "<leader>gg", ":LazyGit<CR>", desc = "打开 LazyGit" },
    },
    dependencies = { "nvim-lua/plenary.nvim" },
  },
}
