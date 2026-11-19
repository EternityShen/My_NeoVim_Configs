return {
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      {
        "rcarriga/nvim-dap-ui",
        dependencies = { "nvim-neotest/nvim-nio" },
      },
      {
        "theHamsta/nvim-dap-virtual-text",
        opts = {},
      },
      {
        "Weissle/persistent-breakpoints.nvim",
        opts = {},
      },

      -- 自动配置 adapter
      {
        "jay-babu/mason-nvim-dap.nvim",
        dependencies = { "williamboman/mason.nvim" },
        opts = {
          automatic_installation = true,
          handlers = {},
          ensure_installed = { "codelldb" },
        },
      },
    },

    config = function()
      local dap = require("dap")
      local dapui = require("dapui")
      local pb = require("persistent-breakpoints")

      dapui.setup()
      pb.setup({ load_breakpoints_event = { "BufReadPost" } })

      -------------------------------------------------
      -- Rust / CodeLLDB
      -------------------------------------------------
      dap.adapters.codelldb = {
        type = "server",
        port = "${port}",
        executable = {
          command = vim.fn.stdpath("data")
              .. "/mason/bin/codelldb",
          args = { "--port", "${port}" },
        },
      }

      dap.configurations.rust = {
        {
          name = "Launch",
          type = "codelldb",
          request = "launch",

          program = function()
            return vim.fn.input(
              "Binary: ",
              vim.fn.getcwd() .. "/target/debug/",
              "file"
            )
          end,

          cwd = "${workspaceFolder}",
          stopOnEntry = false,
        },
      }

      -------------------------------------------------
      -- UI 自动开关
      -------------------------------------------------
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

      --常用快捷键
      vim.keymap.set("n", "<F5>", dap.continue, { desc = "调试：启动/继续" })
      vim.keymap.set("n", "<F10>", dap.step_over, { desc = "调试：单步跳过" })
      vim.keymap.set("n", "<F11>", dap.step_into, { desc = "调试：单步进入" })
      vim.keymap.set("n", "<F12>", dap.step_out, { desc = "调试：单步退出" })
      vim.keymap.set("n", "<leader>dk", dap.toggle_breakpoint, { desc = "调试：切换断点" })
      vim.keymap.set("n", "<leader>dK", function() dap.set_breakpoint(vim.fn.input("断点条件：")) end, { desc = "调试：设置条件断点" })
      vim.keymap.set("n", "<leader>dr", dap.repl.open, { desc = "调试：打开REPL" })
      vim.keymap.set("n", "<leader>du", dapui.toggle, { desc = "调试：切换UI" })
    end,
  },
}
