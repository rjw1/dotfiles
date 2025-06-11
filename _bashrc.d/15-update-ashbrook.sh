alias update-ashbrook="ssh -A ashbrook.default.rjw1.uk0.bigv.io git pull"
alias update-sympl-config='ssh -A sympl@mail01rjw.vs.mythic-beasts.com "cd /srv; git pull"'
alias update-sympl-dns='ssh -A mail01rjw.vs.mythic-beasts.com "sudo /root/BytemarkDNS/run-dns.sh"'
alias spamtrain-sympl='ssh sympl@mail01rjw.vs.mythic-beasts.com "/usr/bin/sa-learn --spam /srv/randomness.org.uk/mailboxes/bob/Maildir/.spamtrain"'
