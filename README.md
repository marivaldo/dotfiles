# 🏠 Dotfiles

My personal development environment configuration files.

## 📦 What's included

- **Neovim (LazyVim)**: Text editor configuration with custom LSP setup for Ruby
- **Fish Shell**: Modern shell configuration
- **Git**: Git configuration and aliases

## 🚀 Quick Start

### Prerequisites

- [Neovim](https://neovim.io/) (>= 0.9.0)
- [Fish Shell](https://fishshell.com/)
- [Git](https://git-scm.com/)
- [mise](https://mise.jdx.dev/) (or asdf/rbenv for Ruby version management)

### Installation

1. Clone this repository:
```bash
git clone https://github.com/YOUR_USERNAME/dotfiles.git ~/dotfiles
```

2. Backup your existing configs:
```bash
mv ~/.config/nvim ~/.config/nvim.backup
mv ~/.config/fish ~/.config/fish.backup
mv ~/.gitconfig ~/.gitconfig.backup
```

3. Copy the configs you want:
```bash
# Neovim
cp -r ~/dotfiles/nvim ~/.config/nvim

# Fish shell
cp -r ~/dotfiles/fish ~/.config/fish

# Git (copy example and customize with your info)
cp ~/dotfiles/git/gitconfig.example ~/.gitconfig
# Edit ~/.gitconfig with your name, email, etc.
```

## 📁 Structure

```
dotfiles/
├── README.md               # This file
├── nvim/                   # Neovim configuration (LazyVim)
│   ├── lua/
│   │   └── plugins/        # Custom plugin configurations
│   └── README.md           # Neovim-specific documentation
├── fish/                   # Fish shell configuration
│   ├── config.fish         # Main config file
│   ├── functions/          # Custom functions
│   └── completions/        # Shell completions
└── git/                    # Git configuration
    └── gitconfig.example   # Git config template (customize with your info)
```

## ✨ Highlights

### Neovim
- **LazyVim** distribution with custom configurations
- **Ruby LSP** with version manager support (mise/asdf/rbenv)
- Custom keymaps and plugins

See [nvim/README.md](./nvim/README.md) for detailed Neovim documentation.

### Fish Shell
- Custom functions and aliases
- Integration with mise for version management

### Git
- Useful aliases (ci, st, br, co, lg, hist)
- Colorful output
- Custom configurations for better workflows
- **Note:** Use `gitconfig.example` as template - update with your personal information

## 🔧 Customization

Feel free to fork and customize these dotfiles to your needs. The configs are well-documented and modular.

## 📝 Notes

- The Neovim config includes a custom Ruby LSP wrapper to fix version mismatch errors
- Make sure to install required dependencies for each tool
- Configs are macOS-friendly but should work on Linux with minimal changes

## 🤝 Contributing

If you find issues or have suggestions, feel free to open an issue or PR!

## 📄 License

MIT License - Feel free to use and modify as you wish.

---

**Last updated:** 2026-01-29
**Maintained by:** Marivaldo Cavalheiro
