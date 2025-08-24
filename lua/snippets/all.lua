-- ~/.config/nvim/lua/snippets/all.lua or wherever you keep your snippets
local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node

return {
   s(
      "lorem",
      t(
         "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua."
      )
   ),
}
