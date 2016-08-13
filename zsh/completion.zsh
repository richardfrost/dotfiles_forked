# matches case insensitive for lowercase
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# pasting with tabs doesn't perform completion
zstyle ':completion:*' insert-tab pending

###
# Hostname completion for ssh commands
$h=()

# Compltion from history
# h=($(echo $(history | awk '{print $2 " " $3}' | grep 'ssh ' | awk '{print $2}' | sort -u)))

# Completion from custom_hosts list: "$HOME/.ssh/custom_hosts"
[[ -r $HOME/.ssh/custom_hosts ]] && h=($h $(cat $HOME/.ssh/custom_hosts))

if [[ $#h -gt 0 ]]; then
  zstyle ':completion:*:ssh:*' hosts $h
fi

###
# git
# compdef '_dispatch git git' g
