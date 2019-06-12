# If not running interactively, don't do anything
[[ $- != *i* ]] && return

main() {
  setup_all_the_bash_stuff
  setup_ellipsis

  add_to_path $HOME/.local/bin
  add_to_path /usr/local/go/bin

  export NVM_DIR="$HOME/.nvm"
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
  [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

  export GOPATH="$HOME/go"
  alias vpn='sudo openconnect -b -l -u JHossler --juniper vpn.adtran.com'
  alias vpn-reset='sudo kill -6 $(pidof openconnect)'
  shopt -s checkwinsize

  # Aliases
  alias la='ls -la'
  alias activenv='source venv/bin/activate'
  alias activenvv='source /home/twan/Documents/venv/bin/activate'
  alias mybash='vim /home/twan/.bashrc'
  alias mytmux='vim /home/twan/.tmux.conf'
  alias rebash='source ~/.bashrc'
  alias get6310buildparameters='wget https://jenkins-m1-hsv.adtran.com/job/fiber_github_organization/job/1u-olt-16port/job/master/lastSuccessfulBuild/artifact/build_parameters.json'
  alias mygrep='grep -nr $1'
  alias open='gio open $1'
  alias fiber='cd ~/Documents/git/fiber'
  alias c='clear'
  alias sharefolder='echo twan-pc:25565; python -m SimpleHTTPServer 25565'

  # settings
  stty -ixon
}

create_aliases() {
  alias grep='grep --color=auto --exclude=*~'
  alias ls='ls --color=auto'
  command_exists thefuck && eval $(thefuck --alias shimatta)
}

command_exists() {
  false
}

setup_ellipsis() {
  export ELLIPSIS_PROTO=ssh
  add_to_path $HOME/.ellipsis/bin
}

setup_bash_it() {
  export BASH_IT="$HOME/.bash_it"
  export BASH_IT_THEME='atomic'
  export BASH_IT_AUTOMATIC_RELOAD_AFTER_CONFIG_CHANGE=1
  export SCM_CHECK=true  # Show SCM status in prompt
  export THEME_SHOW_CLOCK=true
  export THEME_SHOW_BATTERY=true
  source $BASH_IT/bash_it.sh
}

setup_environment_variables() {
  export EDITOR=nvim
  unset MAILCHECK  # Never check mail
  export NO_AT_BRIDGE=1  # http://unix.stackexchange.com/questions/230238
  export HISTSIZE=100000  # More command history! YAY!
  export HISTFILESIZE=10000000  # and the space to store those commands
  export HISTCONTROL=ignoreboth  # Ignore duplicate commands and commands that start with ' '
  export HISTCONTROL+=':erasedups'  # Erase duplicates form history
  export HISTIGNORE='ls:bg:fg:history'
  safe_append_prompt_command 'history -a'  # Store history immediately
  export GPG_TTY=$(tty)  # Enables interactive password entry for gpg
  export CHROME_BIN=chromium  # Enables angular to find chrome exe
  export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'
}

setup_all_the_bash_stuff() {
  setup_bash_it
  setup_environment_variables
  create_aliases
}

add_to_path() {
  export PATH="$1":"$PATH"
}
export -f add_to_path

[[ -s "/usr/lib/ccache/bin" ]] && add_to_path "/usr/lib/ccache/bin"

add_to_path "$HOME/.cargo/bin"

add_to_path "$HOME/.rvm/bin"
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"

# Enable touch screen scrolling for firefox
export MOZ_USE_XINPUT2=1

export XDG_CONFIG_HOME=$HOME/.config
export XDG_CACHE_HOME=$HOME/.cache
export XDG_DATA_HOME=$HOME/.local/share


if [ -z "$DISPLAY" ] && [ -n "$XDG_VTNR" ] && [ "$XDG_VTNR" -eq 1 ] && [ -z "$TMUX" ] && [ -z "$SSH_CONNECTION" ]; then
  exec startx
fi
main


if [ -f ~/.local/lib/python2.7/site-packages/powerline/bindings/bash/powerline.sh ]; then
      source ~/.local/lib/python2.7/site-packages/powerline/bindings/bash/powerline.sh
fi

