return {

  -- gitsigns.nvim: Git 状态显示插件
  {
    "lewis6991/gitsigns.nvim",

    event = { "BufReadPre", "BufNewFile" },

    opts = {
      signs = {
        add          = { text = "▎" },
        change       = { text = "▎" },
        delete       = { text = "_" },
        topdelete    = { text = "‾" },
        changedelete = { text = "~" },
        untracked    = { text = "▎" },
      },

      on_attach = function(bufnr)
        local gs = package.loaded.gitsigns
      end,
    },
  },

  -- lazygit.nvim: LazyGit 集成插件
  {
    "kdheepak/lazygit.nvim",

    cmd = { "LazyGit", "LazyGitCurrentFile" },

    keys = {
      { "<leader>gg", ":LazyGit<CR>", desc = "打开 LazyGit" },
    },

    dependencies = { "nvim-lua/plenary.nvim" },
  },
}
