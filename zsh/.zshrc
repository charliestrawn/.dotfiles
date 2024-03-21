
# requires neovim which is aliased to v -> vim in ~/.aliases
export EDITOR=nvim
export GOPATH="$HOME/work"

# Order matters, first in the path will be chosen
export PATH="/usr/local/bin:$PATH"
export PATH="$HOME/.pub-cache/bin:$PATH"
export PATH="$GOPATH/bin:$PATH"

if [ -f "$(brew --prefix)/bin/virtualenv_wrapper.sh" ]; then
    export VIRTUALENVWRAPPER_SCRIPT="$(brew --prefix)/bin/virtualenvwrapper.sh"
    source "$(brew --prefix)/bin/virtualenvwrapper_lazy.sh"
fi

source "$(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
source "$(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh"

if [ -d ~/.wk ]; then
    source ~/.wk/profile
    export PATH="$HOME/.wk/bin:$PATH"
fi

export CPL_GIT_REPOS_DIR="$HOME/bench"

. "$(brew --prefix)/opt/asdf/libexec/asdf.sh"
. ~/.asdf/plugins/java/set-java-home.zsh

export GPG_TTY=$(tty)
export LDFLAGS="-L/opt/homebrew/opt/openssl@3/lib"
export CPPFLAGS="-I/opt/homebrew/opt/openssl@3/include"


# workaround some issues building huge dart repos
ulimit -n 1000

source ~/.aliases
source ~/.functions
[ -f ~/.secrets ] && source ~/.secrets
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export ZSH="$HOME/.oh-my-zsh"
plugins=(
    git
    gradle
    macos
    brew
    asdf
)
source $ZSH/oh-my-zsh.sh

source "$(brew --prefix)/opt/spaceship/spaceship.zsh"

# supposedly needs to be last
eval "$(zoxide init zsh)"

