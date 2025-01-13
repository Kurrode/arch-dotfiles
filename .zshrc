# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
# End of lines configured by zsh-newuser-install

# Add starship prompt
eval "$(starship init zsh)"
fastfetch

# The following lines were added by compinstall
zstyle :compinstall filename '/home/kur/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

# Allow yazi to change working directory
function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}

# Aliases
alias l='ls -lFh'
alias zshrc='nvim ~/.zshrc'

# Add a function to reload zsh
function reload_zsh() {
  source ~/.zshrc
}

zle -N reload_zsh

bindkey '^Z' reload_zsh

# Adding Plugins
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
