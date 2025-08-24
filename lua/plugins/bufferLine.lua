return {
   "akinsho/bufferline.nvim",
   dependencies = { "nvim-tree/nvim-web-devicons" },
   config = function()
      require("bufferline").setup({
         options = {
            diagnostics = "nvim_lsp",
            offsets = {
               {
                  filetype = "neo-tree",
                  text = "File Explorer",
                  highlight = "Directory",
                  separator = true,
               },
            },
            show_buffer_close_icons = false,
            show_close_icon = false,
            separator_style = "slant",
         },
      })
      -- Cycle through buffers
      vim.api.nvim_set_keymap("n", "<Tab>", "<Cmd>BufferLineCycleNext<CR>", { noremap = true, silent = true })
      vim.api.nvim_set_keymap("n", "<S-Tab>", "<Cmd>BufferLineCyclePrev<CR>", { noremap = true, silent = true })

      -- Move buffers around
      vim.api.nvim_set_keymap("n", "<leader>bn", "<Cmd>BufferLineMoveNext<CR>", { noremap = true, silent = true })
      vim.api.nvim_set_keymap("n", "<leader>bp", "<Cmd>BufferLineMovePrev<CR>", { noremap = true, silent = true })

      -- Close current buffer
      vim.api.nvim_set_keymap("n", "<leader>bd", "<Cmd>bdelete<CR>", { noremap = true, silent = true })

      -- Pick a buffer using a number
      vim.api.nvim_set_keymap("n", "<leader>1", "<Cmd>BufferLineGoToBuffer 1<CR>", { noremap = true, silent = true })
      vim.api.nvim_set_keymap("n", "<leader>2", "<Cmd>BufferLineGoToBuffer 2<CR>", { noremap = true, silent = true })
      vim.api.nvim_set_keymap("n", "<leader>3", "<Cmd>BufferLineGoToBuffer 3<CR>", { noremap = true, silent = true })
      vim.api.nvim_set_keymap("n", "<leader>4", "<Cmd>BufferLineGoToBuffer 4<CR>", { noremap = true, silent = true })
      vim.api.nvim_set_keymap("n", "<leader>5", "<Cmd>BufferLineGoToBuffer 5<CR>", { noremap = true, silent = true })

      -- Close all buffers except the current one
      vim.api.nvim_set_keymap("n", "<leader>bo", "<Cmd>BufferLineCloseOthers<CR>", { noremap = true, silent = true })

      -- Close all buffers to the right/left
      vim.api.nvim_set_keymap("n", "<leader>br", "<Cmd>BufferLineCloseRight<CR>", { noremap = true, silent = true })
      vim.api.nvim_set_keymap("n", "<leader>bl", "<Cmd>BufferLineCloseLeft<CR>", { noremap = true, silent = true })

      -- Pick a buffer interactively
      vim.api.nvim_set_keymap("n", "<leader>bb", "<Cmd>BufferLinePick<CR>", { noremap = true, silent = true })
      vim.api.nvim_set_keymap("n", "<leader>bc", "<Cmd>BufferLinePickClose<CR>", { noremap = true, silent = true })
   end,
}
