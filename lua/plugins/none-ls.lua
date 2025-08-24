return {
   {
      "nvimtools/none-ls.nvim",
      config = function()
         local null_ls = require("null-ls")

         null_ls.setup({
            sources = {
               null_ls.builtins.formatting.stylua.with({
                  extra_args = { "--indent-type", "Spaces", "--indent-width", "3" },
               }),
               null_ls.builtins.formatting.black, -- Black enforces 4 spaces by default
               null_ls.builtins.formatting.isort,
               null_ls.builtins.formatting.clang_format.with({
                  extra_args = { "-style={IndentWidth: 3}" },
               }),
               null_ls.builtins.completion.spell,
            },
         })

         vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
      end,
   },
}
