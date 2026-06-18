return {
  "CopilotC-Nvim/CopilotChat.nvim",
  dependencies = {
    "zbirenbaum/copilot.lua",
    "nvim-lua/plenary.nvim",
  },
  build = "make tiktoken",
  opts = {
    window = {
      layout = "vertical",
      width = 0.4,
    },
  },
}

