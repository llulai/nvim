# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

This is a Neovim configuration based on kickstart.nvim, a minimal but feature-rich starting template. The configuration is designed to be readable, modular, and extensible while providing a solid foundation for development work.

## Architecture

### Core Structure
- **`init.lua`**: Main configuration file containing all plugin setup, LSP configuration, keymaps, and options
- **`lua/custom/plugins/`**: Custom plugin directory for user-added functionality
- **`lua/kickstart/plugins/`**: Optional kickstart plugins (autoformat, debug) - currently not enabled
- **`lazy-lock.json`**: Plugin version lock file managed by lazy.nvim

### Plugin Management
- Uses [lazy.nvim](https://github.com/folke/lazy.nvim) as package manager
- Plugins are defined in `init.lua` around lines 65-230
- Custom plugins can be added to `lua/custom/plugins/` directory

### Key Components

**LSP & Completion**:
- Uses `nvim-lspconfig` with Mason for LSP server management
- Configured servers: `angularls`, `lua_ls` (init.lua:470-484)
- Completion via `nvim-cmp` with LuaSnip snippets
- Custom LSP on_attach function provides consistent keymaps across all language servers

**Navigation & Search**:
- Telescope for fuzzy finding (files, buffers, grep, LSP symbols)
- Treesitter for syntax highlighting with configured parsers for: c, cpp, go, lua, python, rust, tsx, typescript, svelte, html, css, scss, javascript, json, markdown, mdx
- Custom Angular component navigation via `angular_jump.lua`

**Custom Features**:
- Angular-specific navigation: `<C-j>` (TypeScript), `<C-k>` (HTML), `<C-l>` (CSS/SCSS)
- Tabnine AI completion integration
- Custom LSP jump-to-definition handler (init.lua:552-558)

## Common Development Workflows

### Plugin Management
- Install new plugins: Add to `init.lua` plugin table or create files in `lua/custom/plugins/`
- Update plugins: `:Lazy sync`
- View plugin status: `:Lazy`

### LSP Operations
- Install language servers: `:Mason` or add to `servers` table in init.lua
- Format code: `<leader>gp` (LSP formatting)
- Rename symbol: `<leader>rn`
- Code actions: `<leader>ca`
- Go to definition: `gd`
- Find references: `gr`

### Navigation
- Find files: `<leader>sf`
- Live grep: `<leader>sg`
- Search buffers: `<leader>sb`
- Search help: `<leader>sh`
- Search diagnostics: `<leader>sd`

### Angular Development
- Switch between component files:
  - `<C-j>`: Go to TypeScript (.ts)
  - `<C-k>`: Go to HTML template
  - `<C-l>`: Go to SCSS styles
- Works with `.component.` naming convention

## Configuration Details

### Leader Key
- Leader key is set to `<Space>` (init.lua:41)

### Key Customizations
- Relative line numbers enabled
- Tab width set to 4 spaces (init.lua:573)
- Clipboard integration with OS
- Case-insensitive search with smart case

### Theme
- Uses `citruszest` colorscheme (init.lua:124)
- Lualine statusline with custom configuration showing full file paths

### AI Integration
- Tabnine configured with `<Tab>` accept, `<C-]>` dismiss
- 800ms debounce for suggestions
- Excluded from TelescopePrompt and NvimTree

## File Extensions and Patterns

This configuration is optimized for:
- **Web Development**: TypeScript, JavaScript, HTML, CSS, SCSS, MDX
- **Angular**: Component navigation and Angular LSP
- **Systems**: C, C++, Go, Rust, Python
- **Configuration**: Lua, JSON, Markdown

## Important Notes

- The configuration is a fork of kickstart.nvim with personal customizations
- Custom plugins should be added to `lua/custom/plugins/` to avoid conflicts
- LSP servers are automatically installed via Mason based on the `servers` table
- The `angular_jump.lua` plugin assumes Angular component naming convention: `*.component.{ts,html,scss}`