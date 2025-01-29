if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]];
then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Set the directory for zinit and plugins
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

# Download Zinit, if not there yet
if [ ! -d "$ZINIT_HOME" ]; then
  mkdir -p "$(dirname $ZINIT_HOME)"
  gh repo clone zdharma-continuum/zinit "$ZINIT_HOME"
fi

# Source/Load Zinit
source "${ZINIT_HOME}/zinit.zsh"

zinit ice depth=1; zinit light romkatv/powerlevel10k
# zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab

# zmodload zsh/complist
fpath=("$ZDOTDIR/completion/" $fpath)

autoload -U +X bashcompinit && bashcompinit
autoload -Uz compinit && compinit
complete -o nospace -C ~/.local/bin/nomad nomad
complete -o nospace -C ~/.local/bin/packer packer
complete -o nospace -C ~/.local/bin/terraform terraform

export GOPATH="$HOME/go"
export PATH=$GOPATH/bin:$PATH

# Custom PATHs  
export PATH="$PATH:$HOME/dev/env/installs/nvim/bin/"
export PATH="$PATH:$HOME/fvm/default/bin"
export PATH="$PATH:$HOME/.pub-cache/bin"
export PATH="$PATH:$HOME/.docker/bin"
export PATH="$PATH:$HOME/.local/bin"
export PATH="$PATH:$HOME/fvm/default/bin/cache/dart-sdk/bin"
export PATH="$PATH:$HOME/.android/sdk/emulator"
export PATH="$PATH:$HOME/scripts"
export PATH="$PATH:$HOME/.gem/ruby/2.6.0/bin"
export PATH="$PATH:$HOME/.local/share/gem/ruby/3.0.0/bin"
export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"
export PATH="$PATH:/Applications/Android Studio.app/Contents/MacOS"
export PATH="$PATH:$HOME/dev/env/android/platform-tools"
export PATH="$PATH:$HOME/dev/env/rust/cargo/bin"
export PATH="/usr/local/opt/postgresql@15/bin:$PATH"
export PATH="$PATH:$HOME/.pub-cache/global_packages"
export PATH="$PATH:$HOME/installs/lua-language-server/bin/"
export PATH="/opt/homebrew/opt/openjdk@11/bin:$PATH"
export PATH="/opt/homebrew/bin:$PATH"
export PATH="$PATH:$HOME/Library/Python/3.11/bin/"
export PATH="/opt/homebrew/opt/postgresql@15/bin:$PATH"
export PATH="/opt/homebrew/opt/sqlite/bin:$PATH"

# environment variables
export ANDROID_HOME="$HOME/.android/sdk"
export ANDROID_SDK_ROOT="$HOME/.android/sdk"
export CCACHE_DIR="/home/thesmader/Installs/cache"
export DOTBARE_DIR="/home/thesmader/dotfiles"
export DOTBARE_TREE="/home/thesmader"
export EDITOR=nvim
export FLUTTER_ROOT="/home/thesmader/fvm/default/bin"
export DOTFILES="$HOME/.dotfiles/"
export RUSTUP_HOME="$HOME/dev/env/rust/"
export CARGO_HOME="$HOME/dev/env/rust/cargo/"
#export JAVA_HOME="/usr/libexec/java_home"
export JAVA_HOME="/opt/homebrew/opt/openjdk@11/"
export PYENV_ROOT="$HOME/dev/env/.pyenv"

alias c="clear"
alias q="exit"
alias pubg="flutter pub get"
alias gst="git status" 
alias enrc="cd $HOME/.config/nvim/ && nvim ."
alias dy="dig +short @dns.toys"
alias vnv="source .venv/bin/activate"
alias hms="home-manager switch --flake $HOME/.config/nix/"
alias drs="darwin-rebuild switch --flake $HOME/.config/nix#mbp"

function gssh {
  readonly instance=${1:?"Instance name is required"}
  gcloud compute ssh $instance --tunnel-through-iap
}

export N_PREFIX="$HOME/n"; [[ :$PATH: == *":$N_PREFIX/bin:"* ]] || PATH+=":$N_PREFIX/bin"  # Added by n-install (see http://git.io/n-install-repo).

[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

if [ -f '/Users/thesmader/dev/env/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/thesmader/dev/env/google-cloud-sdk/path.zsh.inc'; fi
if [ -f '/Users/thesmader/dev/env/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/thesmader/dev/env/google-cloud-sdk/completion.zsh.inc'; fi


# if [[ -n $(alias g 2>/dev/null) ]]; then
#     unalias g
# fi

export GOROOT="${HOME}/.g/go"
export PATH="${HOME}/.g/bin:${GOROOT}/bin:$PATH"
export G_MIRROR=https://golang.org/dl/

unsetopt beep


bindkey -v
bindkey '^y' autosuggest-accept
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward
bindkey -s '^f' 'tmux-sessionizer\n'

HISTSIZE=1000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' menu no

eval "$(fzf --zsh)"
eval "$(zoxide init zsh)"
eval "$(direnv hook zsh)"

[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
