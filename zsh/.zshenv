source "$HOME/.cargo/env"

export XDG_CONFIG_HOME="$HOME/.config"

export EDITOR=nvim

export GOPATH="$HOME/work"

# work specific
export GOPRIVATE=github.com/Workiva
export WK_LOCAL_GIT_REPOS_DIR="$HOME/bench"

# eval brew cli, needs to come before asdf
eval "$(/opt/homebrew/bin/brew shellenv)"

export ASDF_DATA_DIR="$HOME/.asdf"
export PATH="$ASDF_DATA_DIR/shims:$PATH"

source "$ASDF_DATA_DIR/plugins/golang/set-env.zsh"
source "$ASDF_DATA_DIR/plugins/java/set-java-home.zsh"

export PATH="/usr/local/bin:$PATH"
export PATH="$HOME/.pub-cache/bin:$PATH"
export PATH="$GOPATH/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="/opt/homebrew/opt/mysql-client/bin:$PATH"

# opencode
export PATH=/Users/charlie.strawn/.opencode/bin:$PATH

