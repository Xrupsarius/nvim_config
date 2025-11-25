return {
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "rcarriga/nvim-dap-ui",
      "theHamsta/nvim-dap-virtual-text",
      "mfussenegger/nvim-jdtls",
    },
    config = function()
      local dap = require("dap")
      local dapui = require("dapui")

      ------------------------------------------------------------------
      -- UI + virtual text
      ------------------------------------------------------------------
      require("nvim-dap-virtual-text").setup()
      dapui.setup()

      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close()
      end
      dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close()
      end


      ------------------------------------------------------------------
      -- JAVA (через jdtls) — правильный способ
      ------------------------------------------------------------------
      local jdtls = require("jdtls")

      dap.adapters.java = function(callback)
        jdtls.setup_dap({ hotcodereplace = "auto" })
        callback({
          type = "server",
          host = "127.0.0.1",
          port = jdtls.dap_port(),
        })
      end

      dap.configurations.java = {
        {
          type = "java",
          request = "launch",
          name = "Debug (Java)",
          mainClass = function()
            return vim.fn.input("Main class: ")
          end,
          projectName = vim.fn.fnamemodify(vim.fn.getcwd(), ":t"),
        },
      }

      ------------------------------------------------------------------
      -- KEYMAPS
      ------------------------------------------------------------------
      local map = vim.keymap.set
      map("n", "<F5>", function() dap.continue() end, { desc = "DAP Continue" })
      map("n", "<F10>", function() dap.step_over() end, { desc = "DAP Step Over" })
      map("n", "<F11>", function() dap.step_into() end, { desc = "DAP Step Into" })
      map("n", "<F12>", function() dap.step_out() end, { desc = "DAP Step Out" })

      map("n", "<C-F7>s", function() dap.toggle_breakpoint() end, { desc = "DAP Breakpoint" })
      map("n", "<C-F8>B", function()
        dap.set_breakpoint(vim.fn.input("Condition: "))
      end, { desc = "DAP Conditional Breakpoint" })

      map("n", "<leader>du", function() dapui.toggle() end, { desc = "DAP UI" })
      map("n", "<leader>dr", function() dap.repl.open() end, { desc = "DAP REPL" })
    end,
  },
}

