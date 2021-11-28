umask 022
setopt nobgnice
bindkey -v
autoload -U compinit
autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey -a k up-line-or-beginning-search
bindkey -a j down-line-or-beginning-search
bindkey -a o accept-line-and-down-history
bindkey -a q push-input
compinit

prompt="
%S%F{0} $(test -z "$SSH_CONNECTION" || echo "%m:")%~ %f%s "

function ls {
	/usr/bin/ls -F "$@"
}

function cd {
	pushd "$@" > /dev/null && ls
}

function pd {
	pushd +1 > /dev/null && ls
}

function nd {
	pushd -0 > /dev/null && ls
}

function vi {
	"$EDITOR" "$@"
}

test -f .zshrc-ex && source .zshrc-ex
