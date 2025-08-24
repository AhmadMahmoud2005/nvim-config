return {
   {
      "goolord/alpha-nvim",
      dependencies = { "nvim-tree/nvim-web-devicons" },
      config = function()
         local alpha = require("alpha")
         local dashboard = require("alpha.themes.dashboard")

         -- Custom ASCII Art for NeoVim
         -- From this link: https://www.patorjk.com/software/taag/#p=display&f=ANSI%20Shadow&t=Neovim
         dashboard.section.header.val = {
            " ",
            " ",
            "██╗   ██╗ ██████╗ ██╗   ██╗    ███████╗███████╗███████╗███████╗",
            "╚██╗ ██╔╝██╔═══██╗██║   ██║    ██╔════╝██╔════╝██╔════╝██╔════╝",
            " ╚████╔╝ ██║   ██║██║   ██║    ███████╗███████╗█████╗  █████╗  ",
            "  ╚██╔╝  ██║   ██║██║   ██║    ╚════██║╚════██║██╔══╝  ██╔══╝  ",
            "   ██║   ╚██████╔╝╚██████╔╝    ███████║███████║███████╗██║     ",
            "   ╚═╝    ╚═════╝  ╚═════╝     ╚══════╝╚══════╝╚══════╝╚═╝     ",
            " ",
            "       Welcome to NeoVim 🚀",
            " ",
         }
         -- Apply color to the header
         vim.api.nvim_set_hl(0, "DashboardHeader", { fg = "#61afef", bold = true }) -- Blue color
         dashboard.section.header.opts.hl = "DashboardHeader"

         -- Set buttons for quick access
         dashboard.section.buttons.val = {
            dashboard.button("e", "📄 New file", ":ene <BAR> startinsert <CR>"),
            dashboard.button("f", "🔍 Find file", ":Telescope find_files<CR>"),
            dashboard.button("r", "🕒 Recent files", ":Telescope oldfiles<CR>"),
            dashboard.button("q", "❌ Quit Neovim", ":qa<CR>"),
         }

         -- Apply color to the footer
         vim.api.nvim_set_hl(0, "DashboardFooter", { fg = "#61afef", italic = true }) -- Blue color
         dashboard.section.footer.val = {
            " ",
            "Make it work, make it right, make it fast. 🚀",
         }
         dashboard.section.footer.opts.hl = "DashboardFooter"

         alpha.setup(dashboard.opts)
      end,
   },
}
