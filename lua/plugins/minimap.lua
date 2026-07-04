return {
  "Isrothy/neominimap.nvim",
  version = "v3.x.x",
  lazy = false, -- NOTE: NO NEED to Lazy load
  -- Optional. You can also set your own keybindings
  keys = {
    -- Global Minimap Controls
    { "<leader>nm",  "<cmd>Neominimap Toggle<cr>",      desc = "切换全局迷你地图" },
    { "<leader>no",  "<cmd>Neominimap Enable<cr>",      desc = "启用全局迷你地图" },
    { "<leader>nc",  "<cmd>Neominimap Disable<cr>",     desc = "禁用全局迷你地图" },
    { "<leader>nr",  "<cmd>Neominimap Refresh<cr>",     desc = "刷新全局迷你地图" },

    -- Window-Specific Minimap Controls
    { "<leader>nwt", "<cmd>Neominimap WinToggle<cr>",   desc = "切换当前窗口的迷你地图" },
    { "<leader>nwr", "<cmd>Neominimap WinRefresh<cr>",  desc = "刷新当前窗口的迷你地图" },
    { "<leader>nwo", "<cmd>Neominimap WinEnable<cr>",   desc = "启用当前窗口的迷你地图" },
    { "<leader>nwc", "<cmd>Neominimap WinDisable<cr>",  desc = "禁用当前窗口的迷你地图" },

    -- Tab-Specific Minimap Controls
    { "<leader>ntt", "<cmd>Neominimap TabToggle<cr>",   desc = "切换当前标签页的迷你地图" },
    { "<leader>ntr", "<cmd>Neominimap TabRefresh<cr>",  desc = "刷新当前标签页的迷你地图" },
    { "<leader>nto", "<cmd>Neominimap TabEnable<cr>",   desc = "启用当前标签页的迷你地图" },
    { "<leader>ntc", "<cmd>Neominimap TabDisable<cr>",  desc = "禁用当前标签页的迷你地图" },

    -- Buffer-Specific Minimap Controls
    { "<leader>nbt", "<cmd>Neominimap BufToggle<cr>",   desc = "切换当前缓冲区的迷你地图" },
    { "<leader>nbr", "<cmd>Neominimap BufRefresh<cr>",  desc = "刷新当前缓冲区的迷你地图" },
    { "<leader>nbo", "<cmd>Neominimap BufEnable<cr>",   desc = "启用当前缓冲区的迷你地图" },
    { "<leader>nbc", "<cmd>Neominimap BufDisable<cr>",  desc = "禁用当前缓冲区的迷你地图" },

    ---Focus Controls
    { "<leader>nf",  "<cmd>Neominimap Focus<cr>",       desc = "聚焦到迷你地图" },
    { "<leader>nu",  "<cmd>Neominimap Unfocus<cr>",     desc = "取消聚焦迷你地图" },
    { "<leader>ns",  "<cmd>Neominimap ToggleFocus<cr>", desc = "切换迷你地图聚焦" },
  },
  init = function()
    -- The following options are recommended when layout == "float"
    vim.opt.wrap = false
    vim.opt.sidescrolloff = 36 -- Set a large value

    --- Put your configuration here
    ---@type Neominimap.UserConfig
    vim.g.neominimap = {
      auto_enable = true,
    }
  end,
}
