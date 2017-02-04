if test -f $HOME/.gpg-agent-info && kill -0 `cut -d: -f 2 $HOME/.gpg-agent-info` 2>/dev/null; then
        GPG_AGENT_INFO=`cat $HOME/.gpg-agent-info`
        export GPG_AGENT_INFO 
else
        eval `gpg-agent --daemon`
        echo $GPG_AGENT_INFO >$HOME/.gpg-agent-info
fi
# Imperative that this environment variable always reflects the output
# of the tty command.
GPG_TTY=`tty`
export GPG_TTY
