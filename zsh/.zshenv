export XDG_CONFIG_HOME="$HOME/.config"

export EDITOR=nvim

# work specific
export GOPRIVATE=github.com/Workiva
export WK_LOCAL_GIT_REPOS_DIR="$HOME/bench"

export ASDF_DATA_DIR="$HOME/.asdf"

# shared across go versions so `go install`ed tools survive asdf upgrades
export GOPATH="$HOME/go"
export GOBIN="$GOPATH/bin"
[ -d "$GOBIN" ] || mkdir -p "$GOBIN"

[ -f "$HOME/.cargo/env" ] && source "$HOME/.cargo/env"

# eval brew cli, needs to come before asdf
[ -x /opt/homebrew/bin/brew ] && eval "$(/opt/homebrew/bin/brew shellenv)"

# -U keeps the first copy of each entry, so re-sourcing this file (see
# .zprofile) moves these back to the front instead of duplicating them
typeset -U path
path=(
  "$HOME/.local/bin"
  "$HOME/.pub-cache/bin"
  /usr/local/bin
  "$GOBIN"
  "$ASDF_DATA_DIR/shims"
  "${path[@]}"
)

if [ -f "$ASDF_DATA_DIR/plugins/java/set-java-home.zsh" ]; then
  source "$ASDF_DATA_DIR/plugins/java/set-java-home.zsh"
  JAVA_HOME="$(asdf where java 2>/dev/null)"
  export JAVA_HOME
fi
