return {
   {
      "folke/noice.nvim",
      event = "VeryLazy",
      dependencies = {
         "MunifTanjim/nui.nvim",
         "rcarriga/nvim-notify",
      },
      config = function()
         require("noice").setup({
            cmdline = {
               view = "cmdline_popup", -- Use floating window for commands
            },
            messages = {
               view = "mini", -- Display messages in a small popup
            },
         })
      end,
   },
}
