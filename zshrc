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

export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad
export PROMPT='%{$fg_bold[green]%}%m:%{$fg_bold[blue]%}%~%{$fg_bold[green]%}$(git_prompt_info)%{$reset_color%}%# '
