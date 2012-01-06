autoload -U compinit
compinit

autoload -U colors
colors

git_prompt_info() {
  ref=$($(which git) symbolic-ref HEAD 2> /dev/null) || return
  user=$($(which git) config user.name 2> /dev/null)
  echo " (${user}@${ref#refs/heads/})"
}

set -o emacs
setopt prompt_subst
setopt HIST_IGNORE_DUPS
export HISTSIZE=200

export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad
export PROMPT='%{$fg_bold[green]%}%m:%{$fg_bold[blue]%}%~%{$fg_bold[green]%}$(git_prompt_info)%{$reset_color%}%# '

export GREP_OPTIONS='--color'
export EDITOR=vim

export JAVA_HOME="/Library/Java/Home"

export SYSTEM_SCRIPTS=~/bt/system-scripts
. ~/bt/system-scripts/pairing_stations/ec2env

export PATH="/usr/local/bin:$PATH"
export PATH="/usr/local/ruby186_p383/bin:/opt/local/bin:/opt/local/sbin:$PATH"
export PATH="/opt/local/lib/mysql5/bin:$PATH"
export PATH="/usr/local/ruby/bin:$PATH"
export PATH="/opt/local/lib/postgresql84/bin:$PATH"
export PATH="$PATH:/usr/local/pear/bin"
export PATH="$PATH:$SYSTEM_SCRIPTS/bin"
export PATH="$PATH:$EC2_HOME/bin:$EC2_AMI_HOME/bin"
export PATH="$PATH:/usr/local/Cellar/python/2.7.1/bin"

export MANPATH=/opt/local/share/man:$MANPATH

autoload edit-command-line
zle -N edit-command-line
bindkey '^X^e' edit-command-line

_rake () {
  if [ -f Rakefile ]; then
    compadd `rake --silent --tasks | cut -d " " -f 2`
  fi
}

compdef _rake rake

_cap () {
  if [ -f Capfile ]; then
    compadd `cap -vT | grep '^cap' | cut -d ' ' -f 2`
  fi
}

compdef _cap cap

source ~/.aliases
source ~/.btaliases

[[ -s ~/.zshenv_personal ]] && source ~/.zshenv_personal

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"
