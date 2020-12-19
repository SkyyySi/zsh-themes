#!/usr/bin/env zsh
# Set the language to "C" (the built in one, normally english).
# Note: This does not affect your system language.
LANG=C

# Enable prompt substitution.
setopt promptsubst

# Try to use romkatv's gitstatus when available, otherwise use vcs_info.
if (( ${+functions[gitstatus_query]} )); then
	ZSH_GIT_STATUS_TYPE=gitstatus
else
	autoload -Uz vcs_info
	zstyle ':vcs_info:*' enable git
	zstyle ':vcs_info:*' get-revision true
	zstyle ':vcs_info:*' check-for-chages true
	ZSH_GIT_STATUS_TYPE=vcs_info
fi

# Some things that are not directly related to my themes but that are
# still related to shell theming.

# Add colors to some commands.
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
alias watch='watch --color'
alias ip='ip -c'
export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;31m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;44;33m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;32m'

# Add colors to compinit and use menu selection
eval $(dircolors)
(( ! ${+functions[compinit]} )) || autoload -Uz compinit
zstyle ':completion:*' menu select
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
compinit
