return {
   {
      "mfussenegger/nvim-dap",
      dependencies = {
         "rcarriga/nvim-dap-ui",
         "theHamsta/nvim-dap-virtual-text",
         "nvim-neotest/nvim-nio", -- required for dap-ui
      },
      config = function()
         local dap, dapui = require("dap"), require("dapui")

         -- Adapter (GDB)
         dap.adapters.gdb = {
            type = "executable",
            command = "gdb",
            args = { "--interpreter=dap", "--eval-command", "set print pretty on" },
         }

         -- Configurations
         dap.configurations.cpp = {
            {
               name = "Launch file",
               type = "gdb",
               request = "launch",
               program = function()
                  return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
               end,
               cwd = "${workspaceFolder}",
               stopAtEntry = true,
            },
         }
         dap.configurations.c = dap.configurations.cpp
         dap.configurations.rust = dap.configurations.cpp

         -- UI + Virtual text setup
         dapui.setup()
         require("nvim-dap-virtual-text").setup()

         -- Listeners (UI open/close)
         dap.listeners.after.event_initialized["dapui_config"] = function()
            dapui.open()
         end
         dap.listeners.before.event_terminated["dapui_config"] = function()
            dapui.close()
         end
         dap.listeners.before.event_exited["dapui_config"] = function()
            dapui.close()
         end

         -- Keymaps
         vim.keymap.set("n", "<Leader>dc", function()
            dap.continue()
         end)
         vim.keymap.set("n", "<F10>", function()
            dap.step_over()
         end)
         vim.keymap.set("n", "<F11>", function()
            dap.step_into()
         end)
         vim.keymap.set("n", "<F12>", function()
            dap.step_out()
         end)
         vim.keymap.set("n", "<Leader>dt", function()
            dap.toggle_breakpoint()
         end)
      end,
   },
}
