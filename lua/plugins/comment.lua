return {
   {
      "numToStr/Comment.nvim",
      config = function()
         require("Comment").setup()
         -- vim.keymap.set("n", "gcc", { remap = true, desc = "Toggle comment line" })
         -- vim.keymap.set("v", "gc", { remap = true, desc = "Toggle comment block" })
      end,
   },
}
