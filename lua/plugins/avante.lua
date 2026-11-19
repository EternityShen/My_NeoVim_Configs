return {
  "yetone/avante.nvim",
  build = "make BUILD_FROM_SOURCE=true",
  event = "VeryLazy",
  enabled = false,
  lazy = false,
  version = false,         -- 始终使用最新代码
  opts = {
    provider = "llamacpp", -- 使用我们定义的自定义 provider
    providers = {
      llamacpp = {
        __inherited_from = "openai",           -- 继承 openai 的请求逻辑
        endpoint = "http://127.0.0.1:8080/v1", -- llama-server 地址
        model = "qwen-coder",                  -- 任意字符串，llama-server 会忽略此字段
        api_key_name = "",                     -- 本地无需 API key
        disable_tools = true,                  -- 推荐：本地模型 tool use 支持有限
        extra_request_body = {
          temperature = 0.7,
          max_tokens = 4096,
          repeat_penalty = 1.1,

        },
      },
    },

    behaviour = {
      auto_suggestions = false, -- 本地模型延迟较高，不建议开启
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
