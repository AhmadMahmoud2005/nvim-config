# 💤 Neovim Config (LazyVim-based)

This is my personal **Neovim configuration** built with [lazy.nvim](https://github.com/folke/lazy.nvim) as the plugin manager.  
It is designed for **competitive programming**, **C++/Lua/JavaScript development**, and general coding productivity.

---

## 📂 Project Structure
.
├── init.lua # Main entry point, loads Lazy and configuration
├── lazy-lock.json # Plugin lockfile (versions pinned by lazy.nvim)
├── lua/
│ ├── cpp-template.lua # C++ competitive programming template
│ ├── vim_options.lua # Core Neovim settings (options, keymaps, autocmds)
│ ├── plugins/ # Individual plugin configurations
│ └── snippets/ # Custom code snippets
│ └── all.lua
└── README.md # This file


---

## ⚙️ Core Configuration

### [`init.lua`](./init.lua)
- Loads `lazy.nvim` plugin manager.
- Imports global settings from `vim_options.lua`.
- Ensures all plugins are loaded via `plugins.lua`.

### [`vim_options.lua`](./lua/vim_options.lua)
- Sets up Neovim UI/UX options:
  - Line numbers, relative numbers
  - Tab/indent settings
  - Search behavior
  - Clipboard integration
- Defines some essential keymaps.

### [`cpp-template.lua`](./lua/cpp-template.lua)
- Contains a boilerplate C++ template for **competitive programming**.
- Example: `#include <bits/stdc++.h>` setup with fast I/O.

---

## 📦 Plugins

All plugin configurations live in [`lua/plugins`](./lua/plugins).

| Plugin File            | Description                                                                 |
|-------------------------|-----------------------------------------------------------------------------|
| **alpha.lua**          | Startup dashboard with recent files and quick actions.                     |
| **auto-pairing.lua**   | Auto-close brackets, quotes, etc.                                           |
| **bufferLine.lua**     | Tab-like buffer line at the top.                                            |
| **catppuccin.lua**     | Catppuccin colorscheme configuration.                                       |
| **comment.lua**        | Comment/uncomment code easily (`gc`, `gcc`).                               |
| **competitest.lua**    | Competitive programming plugin for running Codeforces/AtCoder problems.     |
| **completions.lua**    | Autocompletion setup (nvim-cmp + sources).                                  |
| **icons.lua**          | Devicons for files and UI.                                                  |
| **lazygit.lua**        | Integration with [LazyGit](https://github.com/jesseduffield/lazygit).       |
| **lsp-config.lua**     | Language Server Protocol (LSP) setup (C++, Lua, etc.).                      |
| **lualine.lua**        | Statusline configuration.                                                   |
| **neotree.lua**        | File explorer (Neo-tree).                                                   |
| **noice.lua**          | Fancy UI for messages, command line, and LSP progress.                      |
| **none-ls.lua**        | Null-LS integration for formatting & linting.                               |
| **telescope.lua**      | Fuzzy finder for files, symbols, buffers, etc.                              |
| **terminal.lua**       | Integrated floating terminal.                                               |
| **treesitter.lua**     | Better syntax highlighting & parsing.                                       |

---

## ✨ Features

- 🎨 **Beautiful UI** with Catppuccin colors, bufferline, and lualine.
- ⚡ **Lazy loading** for fast startup.
- 🖥️ **LSP & autocompletion** for multiple languages.
- 🔍 **Telescope** for searching files and symbols.
- 🌲 **Treesitter** for syntax highlighting and code structure.
- 🏆 **Competitive programming ready**:
  - `competitest.nvim` for running Codeforces/AtCoder problems.
  - C++ template with fast I/O.
- 📝 **Snippets** for faster coding (`lua/snippets/all.lua`).
- 🖥️ **Floating terminal & LazyGit integration**.

---

## 🚀 Usage

1. **Install Neovim** (>= 0.9 recommended).
2. Clone this repo into your config directory:
   ```bash
   git clone https://github.com/<your-username>/nvim ~/.config/nvim

