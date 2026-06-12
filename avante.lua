return {
  "yetone/avante.nvim",
  enadle = false,
  build = "make BUILD_FROM_SOURCE=true",
  event = "VeryLazy",
  lazy = false,
  version = false,
  opts = {
    provider = "gemini",
    providers = {
      gemini = {
        endpoint = "https://generativelanguage.googleapis.com/v1beta/models",
        model = "gemini-3.5-flash",
        timeout = 30000,
        extra_request_body = {
          generationConfig = {
            temperature = 0.75,
          },
        },
      },
    },
    behaviour = {
      auto_suggestions = false,
    },
  },
  dependencies = {
    "stevearc/dressing.nvim",
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    "nvim-tree/nvim-web-devicons",
    "MeanderingProgrammer/render-markdown.nvim",
  },
}
