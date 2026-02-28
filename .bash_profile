# Homebrew
export HOMEBREW_PREFIX="/opt/homebrew";
export HOMEBREW_CELLAR="/opt/homebrew/Cellar";
export HOMEBREW_REPOSITORY="/opt/homebrew";
export PATH="/opt/homebrew/bin:/opt/homebrew/sbin${PATH+:$PATH}";
export MANPATH="/opt/homebrew/share/man${MANPATH+:$MANPATH}:";
export INFOPATH="/opt/homebrew/share/info:${INFOPATH:-}";

# Environment
export EDITOR=vi
export LC_ALL=C.UTF-8

# History
HISTCONTROL=ignoredups:erasedups:ignorespace

# Signal traps
trap INT
trap HUP
trap TERM

# Completions
if [ -f ~/.brew-completion.bash ]; then
    . ~/.brew-completion.bash
fi

if [ -f ~/.ssh-completion.bash ]; then
    . ~/.ssh-completion.bash
fi

. /usr/share/bash-completion/completions/fzf
. /usr/share/doc/fzf/examples/key-bindings.bash

# Tools
eval "$(fzf --bash)"
. keychain --nolock --eval -q

# Session
if [ -z "$TMUX" ]; then
    unset LC_ALL
    tmux new -t default || tmux new -s default
fi

