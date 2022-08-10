#! /bin/sh
fpath+=(/home/thesmader/.local/share/zsh/site-functions)

setopt autocd extendedglob nomatch menucomplete
setopt interactive_comments
stty stop undef
zle_highlight=('paste:none')

unsetopt BEEP

# completions
[ -f $ZDOTDIR/completion/_flutter ] && fpath+="$ZDOTDIR/completion/"
autoload -Uz compinit
compinit -i
zstyle ':completion:*' menu select
zmodload zsh/complist

# compinit
_comp_options+=(globdots)  # Include hidden files.

autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search

# Colors
autoload -Uz colors && colors

# Useful Functions
source "$ZDOTDIR/zsh-functions"

# Normal files to source
#zsh_add_file "zsh-exports"
#zsh_add_file "zsh-vim-mode"
zsh_add_file "zsh-prompt"

zsh_add_plugin "zsh-users/zsh-autosuggestions"
zsh_add_plugin "zsh-users/zsh-syntax-highlighting"


compdef _gnu_generic flutter

# Setup fzf
# ---------
if [[ ! "$PATH" == */home/thesmader/.fzf/bin* ]]; then
  export PATH="${PATH:+${PATH}:}/home/thesmader/.fzf/bin"
fi


# Custom PATHs  
export PATH="$PATH:$HOME/neovim/bin"
export PATH="$PATH:$HOME/fvm/default/bin"
#export PATH="$PATH:$HOME/dev/env/flutter/bin"
export PATH="$PATH:$HOME/.pub-cache/bin"
export PATH="$PATH:$HOME/.local/bin"
export PATH="$PATH:$HOME/fvm/default/bin/cache/dart-sdk/bin"
export PATH="$PATH:$HOME/.android/sdk/emulator"
export PATH="$PATH:$HOME/scripts"
export PATH="$PATH:$HOME/.gem/ruby/2.7.0/gems"
export PATH="$PATH:$HOME/scripts/svgcleaner-dir"
export PATH="$PATH:$HOME/.yarn/bin"
export PATH="$PATH:$HOME/.local/share/gem/ruby/3.0.0/bin"
export PATH="$PATH:$HOME/installs/gitsizer/"
export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"
export PATH="$PATH:/Users/mac/Library/Android/sdk/platform-tools"
export PATH="$PATH:/Users/mac/Library/Android/sdk/cmdline-tools/latest/bin"
# export PATH="$PATH:$HOME/dev/env/rust/cargo/bin"

# environment variables
export ANDROID_HOME="$HOME/.android/sdk"
export ANDROID_SDK_ROOT="$HOME/.android/sdk"
export CCACHE_DIR="/home/thesmader/Installs/cache"
export CHROME_EXECUTABLE="/Applications/Brave Browser.app/Contents/MacOS/Brave Browser"
export DOTBARE_DIR="/home/thesmader/dotfiles"
export DOTBARE_TREE="/home/thesmader"
export EDITOR=nvim
export FLUTTER_ROOT="/home/thesmader/fvm/default/bin"
export GOPATH=$HOME/go
export PATH="$PATH:$HOME/.pub-cache/global_packages"
export PATH=$GOPATH/bin:/usr/local/go/bin:$PATH
export DOTFILES="$HOME/.dotfiles/"
export RUSTUP_HOME="$HOME/dev/env/rust/"
export CARGO_HOME="$HOME/dev/env/rust/cargo/"

# Custom Aliases
#alias elaichi="cd $HOME/dev/project-elaichi/elaichi"
alias adk="echo "android" | /usr/lib/jvm/java-8-openjdk/bin/keytool -list -v -alias androiddebugkey -keystore ~/.android/debug.keystore | xsel -ib"
alias battery="cat /sys/class/power_supply/BAT0/capacity"
alias c="clear"
alias g="git"
#alias config='/usr/bin/git --git-dir=/home/thesmader/dotfiles/ --work-tree=/home/thesmader'
alias dsa="cd $HOME/dev/dsa"
alias enrc="cd $HOME/.config/nvim/ && nvim ."
alias fl="fvm flutter"
alias gst="git status" 
alias invim="nvim $HOME/.config/nvim/init.vim"
alias lf="lf-ueberzug"
alias pbld="flutter pub run build_runner watch --delete-conflicting-outputs"
alias dbld="dart run build_runner watch --delete-conflicting-outputs"
alias pnvim='nvim --cmd "set rtp+=$(pwd)" .'
alias pubg="flutter pub get"
alias q="exit"
alias screenkey="screenkey -p fixed -g 50%x10%+20%-5% & disown %1"
alias vifmrc="nvim $HOME/.config/vifm/vifmrc"
alias poof="systemctl poweroff"


timezsh() {
  shell=${1-$SHELL}
  for i in $(seq 1 10); do time $shell -i -c exit; done
}

bindkey -v
bindkey -s '^f' 'tmux-sessionizer\n'
bindkey -s '^a' 'tmux-selldash\n'
bindkey "^r" history-incremental-pattern-search-backward

alias luamake=/home/thesmader/Installs/lua-language-server/3rd/luamake/luamake

export N_PREFIX="$HOME/n"; [[ :$PATH: == *":$N_PREFIX/bin:"* ]] || PATH+=":$N_PREFIX/bin"  # Added by n-install (see http://git.io/n-install-repo).
