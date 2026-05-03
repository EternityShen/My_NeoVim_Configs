-- =============================================================================
-- debug.lua - 调试插件
-- =============================================================================


return {
  -- 1. DAP 核心 (必装)
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      -- 2. DAP UI 界面 (强烈推荐)
      {
        "rcarriga/nvim-dap-ui",
        dependencies = { "nvim-neotest/nvim-nio" },
      },
      -- 3. 行内显示变量值 (可选)
      {
        "theHamsta/nvim-dap-virtual-text",
        opts = {},
      },
      -- 4. 持久化断点 (可选)
      {
        "Weissle/persistent-breakpoints.nvim",
        opts = {},
      },
    },
    config = function()
      local dap = require("dap")
      local dapui = require("dapui")
      local pb = require("persistent-breakpoints")

      -- 初始化 UI
      dapui.setup()
      pb.setup({ load_breakpoints_event = { "BufReadPost" } })

      -- 自动打开/关闭 DAP UI
      dap.listeners.before.attach.dapui_config = function()
        dapui.open()
      end
      dap.listeners.before.launch.dapui_config = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated.dapui_config = function()
        dapui.close()
      end
      dap.listeners.before.event_exited.dapui_config = function()
        dapui.close()
      end

      -- 常用快捷键
      vim.keymap.set("n", "<F5>", dap.continue, { desc = "调试：启动/继续" })
      vim.keymap.set("n", "<F10>", dap.step_over, { desc = "调试：单步跳过" })
      vim.keymap.set("n", "<F11>", dap.step_into, { desc = "调试：单步进入" })
      vim.keymap.set("n", "<F12>", dap.step_out, { desc = "调试：单步退出" })
      vim.keymap.set("n", "<leader>dk", dap.toggle_breakpoint, { desc = "调试：切换断点" })
      vim.keymap.set("n", "<leader>dK", function()
        dap.set_breakpoint(vim.fn.input("断点条件："))
      end, { desc = "调试：设置条件断点" })
      vim.keymap.set("n", "<leader>dr", dap.repl.open, { desc = "调试：打开REPL" })
      vim.keymap.set("n", "<leader>du", dapui.toggle, { desc = "调试：切换UI" })
    end,
  },
}

