#
# ~/.bashrc
#
[[ $- != *i* ]] && return

[ -f ~/.bash_aliases ]          && source ~/.bash_aliases
[ -f ~/.config/bash/theme ]     && source ~/.config/bash/theme
[ -f ~/.config/bash/functions ] && source ~/.config/bash/functions

eval "$(fzf --bash)"

PS1='[\u@\h \W]\$ '
export PATH="$HOME/.local/bin:$PATH"
