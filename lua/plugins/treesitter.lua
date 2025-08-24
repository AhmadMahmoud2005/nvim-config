return {
   "nvim-treesitter/nvim-treesitter",
   build = ":TSUpdate",
   config = function()
      local config = require("nvim-treesitter.configs")
      config.setup({
         ensure_installed = { "c", "cpp", "lua", "vim", "vimdoc", "query", "elixir", "heex", "javascript", "html" },
         auto_install = true,
         highlight = { enable = true },
         indent = { enable = false },
         fold = { enable = true },
         additional_vim_regex_highlighting = false,
      })
   end,
}
