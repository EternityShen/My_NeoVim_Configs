-- =============================================================================
-- blankline.lua - 缩进参考线插件配置
-- =============================================================================
-- 在代码缩进处显示垂直参考线，帮助对齐和识别代码块结构

return {
  -- Indent-blankline 插件仓库
  "lukas-reineke/indent-blankline.nvim",
  
  -- 非常懒加载，只在需要时加载
  event = "VeryLazy",
  
  -- 指定主模块名称
  main = "ibl",
  
  -- 插件配置函数
  config = function()
    local ibl = require("ibl")

    -- 基础配置
    ibl.setup({
      -- 缩进线字符设置
      indent = { 
        char = "│"  -- 使用竖线字符作为缩进参考线
      },
      
      -- 启用作用域高亮（显示代码块范围）
      scope = { 
        enabled = true 
      },
    })

    -- 启动界面检测
    local function is_startup_buffer()
      local buf_name = vim.api.nvim_buf_get_name(0)
      local buf_ft = vim.bo.filetype

      -- 检测各种启动界面
      local startup_patterns = {
        "^alpha$", "^dashboard$", "^startify$", "^starter$",
        "NvimTree$", "lazy$", "mason$", "Trouble$"
      }

      for _, pattern in ipairs(startup_patterns) do
        if buf_ft:match(pattern) or buf_name:match(pattern) then
          return true
        end
      end

      -- 检测无文件名且不是正常文件
      if buf_name == "" and vim.bo.buftype ~= "" then
        return true
      end

      return false
    end

    -- 自动命令：进入缓冲区时检查
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

    -- 初始检查
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
    -- create the highlight groups in the highlight setup hook, so they are reset
    -- every time the colorscheme changes
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
