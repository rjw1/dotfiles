# [ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion
export BASH_COMPLETION_COMPAT_DIR="/usr/local/etc/bash_completion.d"
[[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]] && . "/usr/local/etc/profile.d/bash_completion.sh"

. /usr/local/etc/bash_completion.d/git-completion.bash
# terraform completion
complete -C terraform terraform

# added by travis gem for travis completion
[ -f /Users/bob/.travis/travis.sh ] && source /Users/bob/.travis/travis.sh
