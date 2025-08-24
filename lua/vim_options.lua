vim.opt.expandtab = true -- Use spaces instead of tabs
vim.opt.tabstop = 3 -- Number of spaces a tab counts for
vim.opt.softtabstop = 3 -- Fine control over tab behavior
vim.opt.shiftwidth = 3 -- Indentation width for auto-indents
vim.opt.autoindent = true -- Copy indent from the current line
vim.opt.smartindent = true -- Automatically insert indentation
vim.opt.smarttab = true -- Makes tabbing smarter
vim.opt.cindent = true -- Enables C-like indentation (for C, Java, etc.)
vim.opt.breakindent = true -- Indent wrapped lines visually
vim.opt.showmatch = true -- Highlight matching braces
vim.opt.wrap = false -- Disable line wrapping for better readability
vim.opt.showtabline = 2 -- Always show the tabline
vim.opt.cmdheight = 1
vim.opt.showcmd = true
vim.opt.showmode = true
vim.opt.shortmess = vim.opt.shortmess - { "C", "I" }

vim.opt.number = true -- enable absolute line numbers
vim.opt.relativenumber = true -- enable relative line numbers
vim.api.nvim_create_autocmd("insertenter", {
   pattern = "*",
   callback = function()
      vim.opt.relativenumber = false
   end,
})

vim.api.nvim_create_autocmd("insertleave", {
   pattern = "*",
   callback = function()
      vim.opt.relativenumber = true
   end,
})

-- ShortCut for Wrapping (Alt + Z)
vim.keymap.set("n", "<A-z>", function()
   vim.wo.wrap = not vim.wo.wrap
   print("Word Wrap: " .. (vim.wo.wrap and "ON" or "OFF"))
end, { desc = "Toggle Word Wrap" })

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"
vim.cmd([[autocmd BufWritePre * lua vim.lsp.buf.format()]])
vim.lsp.buf.format()

-- For Opening Terminal
vim.keymap.set("n", "<leader>tt", "<cmd>ToggleTerm<cr>", { noremap = true, silent = true })

-- For Removing the Highlight on the searched Word
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- For centering when Scrolling
local opts = { noremap = true, silent = true }

vim.keymap.set("n", "<C-d>", "<C-d>zz", opts)
vim.keymap.set("n", "<C-u>", "<C-u>zz", opts)
vim.keymap.set("n", "<C-f>", "<C-f>zz", opts)
vim.keymap.set("n", "<C-b>", "<C-b>zz", opts)

-- vim.api.nvim_set_hl(0, "normal", { bg = "none" })
-- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
