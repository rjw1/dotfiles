for key in github personal gitlab dxw govpress
do
  alias rsa-delete-${key}-key="ssh-add -d ~/.ssh/id_rsa.4096.${key}"
  alias delete-${key}-key="ssh-add -d ~/.ssh/id_ed25519.${key}"
done
