# Homebrew
fish_add_path /opt/homebrew/bin

if status is-interactive
end

alias txs='tmuxinator start'
alias txo='tmuxinator open'
alias txn='tmuxinator new'
alias txl='tmuxinator list'

alias cl='clear'
alias vim='nvim'
alias vi='command vim'

# Kitty sessions
alias kdev='kitty --session ~/.config/kitty/sessions/dev.conf'

# Added by OrbStack: command-line tools and integration
# This won't be added again if you remove it.
source ~/.orbstack/shell/init2.fish 2>/dev/null || :

export PATH="/opt/homebrew/opt/libpq/bin:$PATH"

# Secrets locais (não commitados)
source ~/.config/fish/config.local.fish 2>/dev/null || :

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/marivaldocavalheiro/google-cloud-sdk/path.fish.inc' ]
    . '/Users/marivaldocavalheiro/google-cloud-sdk/path.fish.inc'
end

# qlty
set --export QLTY_INSTALL "$HOME/.qlty"
set --export PATH $QLTY_INSTALL/bin $PATH

set -x TERM xterm-256color
fish_add_path $HOME/.local/bin

# Starship prompt
starship init fish | source
