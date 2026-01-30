# 💤 LazyVim

A starter template for [LazyVim](https://github.com/LazyVim/LazyVim).
Refer to the [documentation](https://lazyvim.github.io/installation) to get started.

---

## 🔧 Custom Configurations

### Ruby LSP with Version Managers

Ruby LSP is configured to work correctly with version managers (mise/asdf/rbenv) using a wrapper script.

#### Files:

- **`lua/plugins/ruby-lsp.lua`**: LSP configuration that uses the wrapper script
- **`~/.local/bin/ruby-lsp-wrapper`**: Bash wrapper that ensures ruby-lsp uses the correct Ruby version per project

#### How it works:

1. Neovim calls `~/.local/bin/ruby-lsp-wrapper` instead of `ruby-lsp` directly
2. The wrapper detects the correct Ruby version for the current project using mise
3. The wrapper sets the PATH to include the correct Ruby bin directory
4. The wrapper executes `ruby-lsp` with the correct Ruby in PATH

This solves the "Your Ruby version is X.X.X, but your Gemfile specified Y.Y.Y" error.

#### Maintenance:

If you change Ruby versions in a project:

```bash
cd /path/to/project
rm -rf .ruby-lsp/  # Clear LSP cache
nvim .             # Reopen Neovim
```

For more details and troubleshooting, see: `~/Projects/own/dev-toolkit/neovim-troubleshooting/README.md`

#### Why not a pure Neovim solution?

We tested a pure Neovim solution using `on_new_config` hook, but it **doesn't work** because:
- Lua's `io.popen()` creates a subprocess without proper shell context
- Version managers (mise/asdf/rbenv) are not available in that subprocess
- The wrapper script runs with full shell context and has access to version managers
