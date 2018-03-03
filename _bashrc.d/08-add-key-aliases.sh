for key in github personal gitlab dxw
do
  alias add-${key}-key="ssh-add -t 86400 ~/.ssh/id_rsa.4096.${key}"
done


