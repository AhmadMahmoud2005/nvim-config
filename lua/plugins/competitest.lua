return {
   -- CompetiTest Plugin
   {
      "xeluxee/competitest.nvim",
      dependencies = "MunifTanjim/nui.nvim",
      keys = {
         { "<leader>rc", "<cmd>CompetiTest receive contest <CR>", desc = "receive contest" },
         { "<leader>rp", ":CompetiTest receive problem <C-r>+<CR>", desc = "receive problem from clipboard" },
         { "<leader>ra", "<cmd>CompetiTest add_testcase <CR>", desc = "add testcase" },
         { "<leader>re", "<cmd>CompetiTest edit_testcase <CR>", desc = "edit testcase" },
         { "<leader>rr", "<cmd>CompetiTest run <CR>", desc = "run code" },
         { "<leader>rd", "<cmd>CompetiTest delete_testcase <CR>", desc = "delete testcase" },
      },
      config = function()
         require("competitest").setup({
            compile_command = {
               c = { exec = "gcc", args = { "-DMOHAMED", "-Wall", "$(FNAME)", "-o", "$(FNOEXT)" } },
               cpp = {
                  exec = "g++",
                  args = { "-std=c++20", "-DMOHAMED", "-Wall", "$(FNAME)", "-o", "$(FNOEXT)", "-g" },
               },
               py = { exec = "python", args = { "$(FNAME)" } },
               rust = { exec = "rustc", args = { "$(FNAME)" } },
               java = { exec = "javac", args = { "$(FNAME)" } },
            },
            received_problems_path = "$(HOME)/Competitive Programming/$(JUDGE)/$(CONTEST)/$(PROBLEM).$(FEXT)",
            received_contests_directory = "$(HOME)/Competitive Programming/$(JUDGE)/$(CONTEST)",
            received_contests_problems_path = "$(PROBLEM).$(FEXT)",
            received_problems_prompt_path = false,
            testcases_use_single_file = true,
            evaluate_template_modifiers = true,
            received_contests_prompt_directory = false,
            received_contests_prompt_extension = false,
            open_received_contests = false,
            received_files_extension = "cpp",
            template_file = {
               cpp = "~/scripts/CPP.cpp",
            },
         })
      end,
   },
   -- Custom submission functions using external tools
   {
      "nvim-lua/plenary.nvim", -- For async functions
      config = function()
         -- Helper: detect contest/problem from file path
         local function auto_submit_cf()
            local file = vim.fn.expand("%:p")
            local filename = vim.fn.expand("%:t")
            -- Match: ~/Competitive Programming/Codeforces/1850/A.cpp
            local contest, problem = file:match("(%d+)/([A-Z]%w*)%.[^/]+$")
            if not contest or not problem then
               vim.notify("❌ Could not detect contest/problem from path", vim.log.levels.ERROR)
               return
            end

            -- Use cf CLI tool for submission
            local cmd = string.format("cf submit %s %s %s", contest, problem:lower(), filename)
            vim.notify("🚀 Submitting: " .. cmd)

            -- Run the command
            vim.fn.jobstart(cmd, {
               cwd = vim.fn.expand("%:p:h"),
               on_exit = function(_, code)
                  if code == 0 then
                     vim.notify("✅ Submission successful!", vim.log.levels.INFO)
                  else
                     vim.notify("❌ Submission failed!", vim.log.levels.ERROR)
                  end
               end,
            })
         end

         -- Alternative using oj (Online Judge Tools)
         local function auto_submit_oj()
            local file = vim.fn.expand("%:p")
            local filename = vim.fn.expand("%:t")
            local contest, problem = file:match("(%d+)/([A-Z]%w*)%.[^/]+$")
            if not contest or not problem then
               vim.notify("❌ Could not detect contest/problem from path", vim.log.levels.ERROR)
               return
            end

            local url = string.format("https://codeforces.com/contest/%s/problem/%s", contest, problem)
            local cmd = string.format("oj submit %s %s", url, filename)
            vim.notify("🚀 Submitting with oj: " .. cmd)

            vim.fn.jobstart(cmd, {
               cwd = vim.fn.expand("%:p:h"),
               on_exit = function(_, code)
                  if code == 0 then
                     vim.notify("✅ Submission successful!", vim.log.levels.INFO)
                  else
                     vim.notify("❌ Submission failed!", vim.log.levels.ERROR)
                  end
               end,
            })
         end

         -- Keymaps
         vim.keymap.set("n", "<leader>cs", auto_submit_cf, { desc = "Submit with cf CLI" })
         vim.keymap.set("n", "<leader>co", auto_submit_oj, { desc = "Submit with oj" })

         -- Combo: run tests then submit
         vim.keymap.set("n", "<leader>as", function()
            vim.cmd("CompetiTest run")
            vim.defer_fn(function()
               auto_submit_cf()
            end, 1500)
         end, { desc = "Run tests then submit" })
      end,
   },
}
