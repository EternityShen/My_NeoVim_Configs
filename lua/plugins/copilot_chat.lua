return {
  "CopilotC-Nvim/CopilotChat.nvim",
  dependencies = {
    "zbirenbaum/copilot.lua",   -- 你已有
    "nvim-lua/plenary.nvim",
  },
  build = "make tiktoken",
  opts = {
    window = {
      layout = "vertical",  -- 侧边栏样式
      width = 0.4,
    },
  },
}