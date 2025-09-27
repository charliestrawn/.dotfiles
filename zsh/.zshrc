# eval brew cli
eval "$(/opt/homebrew/bin/brew shellenv)"

# requires neovim which is aliased to v -> vim in ~/.aliases
export EDITOR=nvim
export GOPATH="$HOME/work"

export PATH="/usr/local/bin:$PATH"
export PATH="$HOME/.pub-cache/bin:$PATH"
export PATH="$GOPATH/bin:$PATH"

if [ -f "$(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" ]; then
    source "$(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
fi

if [ -f "$(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh" ]; then
    source "$(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh"
fi

# if we have the .wk folder, but no profile, then login hasn't been run yet
# lazily run it, then source the profile
# if we have wk folder, should be able to source the profile
if [ -d ~/.wk ]; then
    # if we don't have the profile, run login to fetch it
    if [ ! -f ~/.wk/profile ]; then
        wk login
    fi
    source ~/.wk/profile
    export PATH="$HOME/.wk/bin:$PATH"
fi

export WK_LOCAL_GIT_REPOS_DIR="$HOME/bench"

# workaround some issues building huge dart repos
ulimit -Sn 8192

export ZSH="$HOME/.oh-my-zsh"
plugins=(encode64 git golang gradle jira macos)
source $ZSH/oh-my-zsh.sh

source "$(brew --prefix)/opt/spaceship/spaceship.zsh"

eval "$(fzf --zsh)"

# fzf git stuff
# https://github.com/junegunn/fzf-git.sh
source ~/fzf-git.sh

# setup asdf for versions >= 0.16.0 
export ASDF_DATA_DIR="$HOME/.asdf"
export PATH="$ASDF_DATA_DIR/shims:$PATH"

# supposedly needs to be last
eval "$(zoxide init zsh)"

source ~/.aliases
source ~/.functions
[ -f ~/.secrets ] && source ~/.secrets

