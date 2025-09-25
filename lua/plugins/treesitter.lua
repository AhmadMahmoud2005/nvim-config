return {
   {
      "nvim-treesitter/nvim-treesitter",
      build = ":TSUpdate",
      dependencies = {
         "nvim-treesitter/nvim-treesitter-textobjects",
      },
      config = function()
         local config = require("nvim-treesitter.configs")
         config.setup({
            ensure_installed = {
               "c",
               "cpp",
               "lua",
               "vim",
               "vimdoc",
               "query",
               "elixir",
               "heex",
               "javascript",
               "html",
            },
            auto_install = true,
            highlight = { enable = true },
            indent = { enable = false },
            fold = { enable = true },
            additional_vim_regex_highlighting = false,

            -- 🔥 this is the important part
            textobjects = {
               select = {
                  enable = true,
                  lookahead = true,              -- jump forward to the next textobj automatically
                  keymaps = {
                     ["af"] = "@function.outer", -- a function (declaration + body)
                     ["if"] = "@function.inner", -- inner part of a function (just the body)
                     ["ac"] = "@class.outer",
                     ["ic"] = "@class.inner",
                     ["aB"] = "@block.outer", -- full block (includes braces)
                     ["iB"] = "@block.inner", -- inside block (no braces)
                  },
               },
            },
         })
      end,
   },
}
