
return {
  -- 1. Core DAP Client
  {
    "mfussenegger/nvim-dap",
    config = function()
      local map = vim.keymap.set
      
      -- Keybindings (only loaded when nvim-dap is needed)
     
      -- Keybindings (Using intuitive F-keys and standard letters)
      map("n", "<leader>b", "<cmd>DapToggleBreakpoint<cr>", { desc = "Toggle Breakpoint" })
      map("n", "<F5>", "<cmd>DapContinue<cr>", { desc = "Start / Continue Debugging" })
      map("n", "<F10>", "<cmd>DapStepOver<cr>", { desc = "Step Over (Next Line)" })
      map("n", "<F11>", "<cmd>DapStepInto<cr>", { desc = "Step Into (Go Inside)" })
      map("n", "<F12>", "<cmd>DapTerminate<cr>", { desc = "Stop Debugging" })
      map("n", "<leader>u", "<cmd>lua require('dapui').toggle()<cr>", { desc = "Toggle Debug UI" })
          end,
  },

  -- 2. Python Specific Adapter Configuration
  {
    "mfussenegger/nvim-dap-python",
    ft = "python",
    dependencies = {
      "mfussenegger/nvim-dap",
      "rcarriga/nvim-dap-ui",
    },
    config = function()
      -- Path to Mason's debugpy installation
      local path = vim.fn.stdpath("data") .. "/mason/packages/debugpy/venv/bin/python"
      require("dap-python").setup(path)
    end,
  },

  -- 3. UI Layer for the Debugger
  {
    "rcarriga/nvim-dap-ui",
    dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
    config = function()
      local dap, dapui = require("dap"), require("dapui")
      dapui.setup()
      
      -- Automate UI opening and closing actions
      dap.listeners.before.attach.dapui_config = function() dapui.open() end
      dap.listeners.before.launch.dapui_config = function() dapui.open() end
      dap.listeners.before.event_terminated.dapui_config = function() dapui.close() end
      dap.listeners.before.event_exited.dapui_config = function() dapui.close() end
    end,
  },
}
