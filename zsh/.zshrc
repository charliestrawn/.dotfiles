# eval brew cli
eval "$(/opt/homebrew/bin/brew shellenv)"

brew_prefix=$(brew --prefix)
if [ -f "$brew_prefix/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" ]; then
    source "$brew_prefix/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
fi

if [ -f "$brew_prefix/share/zsh-autosuggestions/zsh-autosuggestions.zsh" ]; then
    source "$brew_prefix/share/zsh-autosuggestions/zsh-autosuggestions.zsh"
fi

if [ -f "$brew_prefix/share/zsh-history-substring-search/zsh-history-substring-search.zsh" ]; then
    source "$brew_prefix/share/zsh-history-substring-search/zsh-history-substring-search.zsh"
    bindkey '^[[A' history-substring-search-up
    bindkey '^[[B' history-substring-search-down
fi

export XDG_CONFIG_HOME="$HOME/.config"

eval "$(starship init zsh)"
eval "$(fzf --zsh)"

# fzf git stuff
# https://github.com/junegunn/fzf-git.sh
source ~/fzf-git.sh
source ~/.aliases
source ~/.functions

# setup asdf for versions >= 0.16.0 
export ASDF_DATA_DIR="$HOME/.asdf"
export PATH="$ASDF_DATA_DIR/shims:$PATH"

# requires neovim which is aliased to v -> vim in ~/.aliases
export EDITOR=nvim
export GOPATH="$HOME/work"

export PATH="/usr/local/bin:$PATH"
export PATH="$HOME/.pub-cache/bin:$PATH"
export PATH="$GOPATH/bin:$PATH"

export WK_LOCAL_GIT_REPOS_DIR="$HOME/bench"
# workaround some issues building huge dart repos
ulimit -Sn 8192

eval "$(zoxide init zsh)"

