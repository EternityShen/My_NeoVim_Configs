return {
  -- indent-blankline.nvim: 缩进参考线插件
  "lukas-reineke/indent-blankline.nvim",

  event = "VeryLazy",

  main = "ibl",

  config = function()
    local ibl = require("ibl")

    ibl.setup({
      indent = {
        char = "│"
      },

      scope = {
        enabled = true
      },
    })

    local function is_startup_buffer()
      local buf_name = vim.api.nvim_buf_get_name(0)
      local buf_ft = vim.bo.filetype

      local startup_patterns = {
        "^alpha$", "^dashboard$", "^startify$", "^starter$",
        "NvimTree$", "lazy$", "mason$", "Trouble$"
      }

      for _, pattern in ipairs(startup_patterns) do
        if buf_ft:match(pattern) or buf_name:match(pattern) then
          return true
        end
      end

      if buf_name == "" and vim.bo.buftype ~= "" then
        return true
      end

      return false
    end

    vim.api.nvim_create_autocmd("BufEnter", {
      group = vim.api.nvim_create_augroup("IndentBlanklineStartup", { clear = true }),
      callback = function()
        vim.schedule(function()
          if is_startup_buffer() then
            vim.cmd("IBLDisable")
          else
            vim.cmd("IBLEnable")
          end
        end)
      end,
    })

    vim.schedule(function()
      if is_startup_buffer() then
        vim.cmd("IBLDisable")
      end
    end)
    local highlight = {
      "RainbowRed",
      "RainbowYellow",
      "RainbowBlue",
      "RainbowOrange",
      "RainbowGreen",
      "RainbowViolet",
      "RainbowCyan",
    }

    local hooks = require "ibl.hooks"
    hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
      vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#E06C75" })
      vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#E5C07B" })
      vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#61AFEF" })
      vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#D19A66" })
      vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#98C379" })
      vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#C678DD" })
      vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#56B6C2" })
    end)

    require("ibl").setup { indent = { highlight = highlight } }
  end,
}
