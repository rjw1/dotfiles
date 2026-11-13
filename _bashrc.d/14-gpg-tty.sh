# Imperative that this environment variable always reflects the output
# of the tty command. This is so that passphrase entry works
export GPG_TTY=$(tty)
gpg-reauth() {
  gpgconf --reload gpg-agent
  echo test | gpg --clearsign ${1:+-u "$1"} >/dev/null && echo "GPG passphrase cached."
}
