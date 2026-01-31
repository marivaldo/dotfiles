# 🏠 Dotfiles

My personal development environment configuration files.

## 📦 What's included

- **Fish Shell**: Modern shell configuration with aliases and completions
- **Kitty**: GPU-accelerated terminal with dev layout function
- **Starship**: Fast, customizable prompt with git, kubernetes, gcloud info
- **Neovim (LazyVim)**: Text editor configuration with custom LSP setup for Ruby
- **Vim**: Classic vim configuration
- **Git**: Git configuration and aliases
- **SSH**: SSH config example
- **Brewfile**: All Homebrew packages for quick setup

## 🚀 Quick Start

```bash
# Install Homebrew first (if not installed)
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Clone and install everything
git clone git@github.com:marivaldo/dotfiles.git ~/Projects/own/dotfiles
cd ~/Projects/own/dotfiles
./install.sh
```

The install script automatically:
1. Creates symlinks for all configs
2. Installs Homebrew packages (fish, neovim, git, mise, starship, etc.)
3. Installs Fisher and fish plugins

### Prerequisites

- [Homebrew](https://brew.sh/) - required before running install.sh

### What gets installed (via Brewfile)

- [Fish Shell](https://fishshell.com/) + [Starship](https://starship.rs/) prompt
- [Neovim](https://neovim.io/) + [Vim](https://www.vim.org/)
- [Git](https://git-scm.com/) + [GitHub CLI](https://cli.github.com/)
- [mise](https://mise.jdx.dev/) for Ruby/Node version management
- [Kitty](https://sw.kovidgoyal.net/kitty/) terminal
- And many more CLI tools (see Brewfile)

### Installation

1. Clone this repository:
```bash
git clone git@github.com:marivaldo/dotfiles.git ~/Projects/own/dotfiles
```

2. Run the installer:
```bash
./install.sh
```
Note: If configs already exist, remove them manually first or backup.

3. Copy and edit local configs (not committed):
```bash
# SSH config
cp ssh/config.example ssh/config
# Edit with your servers

# Fish secrets (create with your API keys)
touch fish/config.local.fish

# Kitty dev layout (set your project path)
cp fish/functions/dev_layout.fish.example fish/functions/dev_layout.fish
# Edit project_dir in the file
```

### Symlinks Created

```
~/.config/fish          → dotfiles/fish
~/.config/kitty         → dotfiles/kitty
~/.config/nvim          → dotfiles/nvim
~/.config/starship.toml → dotfiles/starship.toml
~/.gitconfig            → dotfiles/git/gitconfig
~/.vimrc                → dotfiles/vim/vimrc
~/.ssh/config           → dotfiles/ssh/config
```

## 📁 Structure

```
dotfiles/
├── README.md               # This file
├── install.sh              # Symlink installer
├── Brewfile                # Homebrew packages
├── starship.toml           # Starship prompt config
├── fish/                   # Fish shell configuration
│   ├── config.fish         # Main config file
│   ├── config.local.fish   # Local secrets (gitignored)
│   ├── conf.d/             # Auto-loaded configs (fzf, etc)
│   ├── functions/          # Custom functions (dev_layout, etc)
│   ├── completions/        # Shell completions
│   └── fish_plugins        # Fisher plugin list
├── kitty/                  # Kitty terminal configuration
│   ├── kitty.conf          # Main config with remote control enabled
│   └── current-theme.conf  # Color theme
├── nvim/                   # Neovim configuration (LazyVim)
│   ├── lua/
│   │   └── plugins/        # Custom plugin configurations
│   └── README.md           # Neovim-specific documentation
├── vim/                    # Vim configuration
│   └── vimrc               # Vim config file
├── git/                    # Git configuration
│   ├── gitconfig           # Git config
│   └── gitconfig.example   # Git config template
└── ssh/                    # SSH configuration
    ├── config              # SSH config (gitignored)
    └── config.example      # SSH config template
```

## ✨ Highlights

### Fish Shell
- Custom functions and aliases
- Integration with mise for version management
- FZF integration for fuzzy search
- Secrets stored in `config.local.fish` (gitignored)
- `dev_layout` function for Kitty dev environment
- Kubernetes aliases: `k`, `kgp`, `kgs`, `kgd`, `klogs`, `kctx`, `kns`

### Kitty Terminal
- GPU-accelerated terminal emulator
- Remote control enabled for scripting
- `dev_layout` command: creates 4 panes (1 large left 70%, 3 stacked right)

### Starship Prompt
- Git branch and status
- Kubernetes context (namespace hidden)
- Terraform workspace
- Docker context
- Ruby/Node/Python versions (when in project)
- Command duration (if > 2s)

### Neovim
- **LazyVim** distribution with custom configurations
- **Ruby LSP** with version manager support (mise/asdf/rbenv)
- **Solargraph** fallback for Ruby < 3.0 projects (via Homebrew)
- **LazyVim Extras**: lang.markdown, editor.outline

**UI Customizations:**
- Picker with `ivy_bottom` layout (input at bottom, reversed list)
- Cmdline at bottom (classic vim style)
- Errors open in split with auto-focus (close with `:q`)
- Notifications in popup (top-right)
- Explorer shows hidden files, `o` to open, `<leader>r` to reveal current file
- Default intro screen instead of dashboard

**Keymaps:**
- `:Q`, `:W`, `:Wq`, `:Qa` work like lowercase versions
- `<leader>r` - reveal current file in explorer
- `<leader>cs` - toggle code outline

See [nvim/README.md](./nvim/README.md) for detailed Neovim documentation.

### Git
- Useful aliases (ci, st, br, co, lg, hist)
- Colorful output
- SSH signing for commits

### Brewfile
- All CLI tools and apps in one file
- Installed automatically by `./install.sh`
- Update with: `brew bundle dump --file=Brewfile --force`

## 🔒 Local Configs (not committed)

Files matching `*_local` and `ssh/config` are gitignored for sensitive data:

| File | Purpose |
|------|---------|
| `fish/config.local.fish` | API keys, tokens, passwords |
| `fish/functions/dev_layout.fish` | Local dev layout with your project paths |
| `ssh/config` | Server IPs, hostnames, users |

## 📝 Notes

- The Neovim config includes a custom Ruby LSP wrapper to fix version mismatch errors
- Make sure to install required dependencies for each tool
- Configs are macOS-friendly but should work on Linux with minimal changes
- Use `vim` alias for Neovim and `vi` for classic Vim

## 📄 License

MIT License - Feel free to use and modify as you wish.

---

**Maintained by:** Marivaldo Cavalheiro
