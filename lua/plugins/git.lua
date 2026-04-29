-- =============================================================================
-- git.lua - Git ¿¿¿¿
-- =============================================================================

return {

  -- ¿¿¿¿¿¿¿¿¿¿¿¿¿¿¿¿¿¿¿¿¿¿¿¿¿¿¿¿¿¿¿¿¿¿¿¿¿¿¿¿¿¿¿¿¿
  -- 1. gitsigns¿¿¿¿¿¿ git ¿¿¿¿
  -- ¿¿¿¿¿¿¿¿¿¿¿¿¿¿¿¿¿¿¿¿¿¿¿¿¿¿¿¿¿¿¿¿¿¿¿¿¿¿¿¿¿¿¿¿¿
  {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPre", "BufNewFile" },
    opts = {
      signs = {
        -- ¿¿¿¿¿¿¿ git ¿¿
        add          = { text = "¿" }, -- ¿¿¿¿¿¿¿¿¿
        change       = { text = "¿" }, -- ¿¿¿¿¿¿¿¿¿
        delete       = { text = "_" }, -- ¿¿¿¿¿¿¿¿¿¿
        topdelete    = { text = "¿" }, -- ¿¿¿¿
        changedelete = { text = "~" }, -- ¿¿+¿¿
        untracked    = { text = "¿" }, -- ¿¿¿¿¿
      },
      -- current_line_blame = true,  -- ¿¿¿¿¿¿¿ git blame ¿¿¿¿¿¿¿¿¿¿¿¿
      -- current_line_blame_opts = {
      --   delay = 1000,             -- ¿¿ 1 ¿¿¿¿ blame ¿¿
      -- },
      on_attach = function(bufnr)
        local gs = package.loaded.gitsigns
      end,
    },
  },

  -- ¿¿¿¿¿¿¿¿¿¿¿¿¿¿¿¿¿¿¿¿¿¿¿¿¿¿¿¿¿¿¿¿¿¿¿¿¿¿¿¿¿¿¿¿¿
  -- 2. lazygit¿¿ Neovim ¿¿¿ lazygit TUI
  -- ¿¿¿¿¿¿¿¿¿¿¿¿¿¿¿¿¿¿¿¿¿¿¿¿¿¿¿¿¿¿¿¿¿¿¿¿¿¿¿¿¿¿¿¿¿
  -- ¿¿¿¿¿ lazygit¿brew install lazygit
  {
    "kdheepak/lazygit.nvim",
    cmd = { "LazyGit", "LazyGitCurrentFile" },
    keys = {
      { "<leader>gg", ":LazyGit<CR>", desc = "¿¿ LazyGit" },
    },
    dependencies = { "nvim-lua/plenary.nvim" },
  },
}
