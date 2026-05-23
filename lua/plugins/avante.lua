return {
  -- avante.nvim: AI 代码助手插件
  "yetone/avante.nvim",
  build = "make BUILD_FROM_SOURCE=true",
  event = "VeryLazy",
  enabled = false,
  lazy = false,
  version = false,
  opts = {
    provider = "llamacpp",
    providers = {
      llamacpp = {
        __inherited_from = "openai",
        endpoint = "http://127.0.0.1:8080/v1",
        model = "qwen-coder",
        api_key_name = "",
        disable_tools = true,
        extra_request_body = {
          temperature = 0.7,
          max_tokens = 4096,
          repeat_penalty = 1.1,

        },
      },
    },

    behaviour = {
      auto_suggestions = false,
      auto_set_highlight_group = true,
      auto_apply_diff_after_generation = false,
    },

    windows = {
      position = "right",
      width = 35,
      wrap = true,
    },
    system_prompt = "你是一个代码助手。直接回答用户的问题，不要重复。",
  },
  dependencies = {
    "stevearc/dressing.nvim",
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    "nvim-tree/nvim-web-devicons",
    "MeanderingProgrammer/render-markdown.nvim",
  },
}
