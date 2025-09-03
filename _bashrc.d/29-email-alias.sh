alias alpine="ssh mail01rjw.vs.mythic-beasts.com rm /home/bob/.opener.sock; ssh mail01rjw.vs.mythic-beasts.com -t tmux attach-session -d -t pine"
alias start-pine-session="ssh mail01rjw.vs.mythic-beasts.com rm /home/bob/.opener.sock; ssh mail01rjw.vs.mythic-beasts.com -t tmux new-session -s pine -d alpine"
