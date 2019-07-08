for key in github personal gitlab dxw govpress
do
  alias delete-${key}-key="ssh-add -d ~/.ssh/id_rsa.4096.${key}"
done
