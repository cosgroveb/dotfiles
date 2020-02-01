source ~/.aliases
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

