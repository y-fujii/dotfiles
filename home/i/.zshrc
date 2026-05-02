umask 022
setopt nobgnice
bindkey -v
autoload -U compinit up-line-or-beginning-search down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey -a k up-line-or-beginning-search
bindkey -a j down-line-or-beginning-search
bindkey -a o accept-line-and-down-history
bindkey -a q push-input
compinit

HISTSIZE=256
PS1="
%S%F{0} $(test -z "$SSH_CONNECTION" || echo "%m:")%~ %f%s "

function ls { /bin/ls -F "$@" }
function cd { pushd "$@" > /dev/null && ls }
function pd { pushd +1 > /dev/null && ls }
function nd { pushd -0 > /dev/null && ls }
function mv { /bin/mv -i "$@" }
function cp { /bin/cp -i "$@" }
function rm { /bin/rm -I "$@" }
function vi { /usr/bin/vim "$@" }

test -f ~/.zshrc-ex && source ~/.zshrc-ex
