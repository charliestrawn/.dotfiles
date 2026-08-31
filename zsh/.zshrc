# set vi mode
# bindkey -v
# bindkey -M vicmd 'v' visual-mode

# restore some of the emacs shortcuts
bindkey '^R' history-incremental-search-backward
bindkey '^A' beginning-of-line
bindkey '^E' end-of-line
bindkey '^W' backward-kill-word
bindkey '^U' backward-kill-line
bindkey '^K' kill-line
bindkey '^Y' yank

# History configuration
HISTFILE=~/.zsh_history
HISTSIZE=100000
SAVEHIST=100000

# Share history across all sessions and append immediately
setopt share_history
setopt extended_history
setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_ignore_space
setopt hist_verify
setopt hist_save_no_dups

if [ -f "$HOMEBREW_PREFIX/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" ]; then
    source "$HOMEBREW_PREFIX/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
fi

if [ -f "$HOMEBREW_PREFIX/share/zsh-autosuggestions/zsh-autosuggestions.zsh" ]; then
    source "$HOMEBREW_PREFIX/share/zsh-autosuggestions/zsh-autosuggestions.zsh"
fi

if [ -f "$HOMEBREW_PREFIX/share/zsh-history-substring-search/zsh-history-substring-search.zsh" ]; then
    source "$HOMEBREW_PREFIX/share/zsh-history-substring-search/zsh-history-substring-search.zsh"
    bindkey '^[[A' history-substring-search-up
    bindkey '^[[B' history-substring-search-down
fi

export LG_CONFIG_FILE="$XDG_CONFIG_HOME/lazygit/config.yml"

eval "$(starship init zsh)"
eval "$(fzf --zsh)"

source "$HOME/.aliases"
source "$HOME/.functions"
source "$HOME/.secrets"

# workaround some issues building huge dart repos
ulimit -Sn 8192

eval "$(zoxide init zsh)"
eval "$($HOMEBREW_PREFIX/bin/brew shellenv)"


