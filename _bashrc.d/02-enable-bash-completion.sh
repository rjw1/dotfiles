# [ -f /opt/homebrew/etc/bash_completion ] && . /opt/homebrew/etc/bash_completion
export BASH_COMPLETION_COMPAT_DIR="/opt/homebrew/etc/bash_completion.d"
[[ -r "/opt/homebrew/etc/profile.d/bash_completion.sh" ]] && . "/opt/homebrew/etc/profile.d/bash_completion.sh"

. /opt/homebrew/etc/bash_completion.d/git-completion.bash
# terraform completion
complete -C terraform terraform

