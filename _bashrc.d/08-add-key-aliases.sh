for key in github personal gitlab dxw govpress
do
  alias add-${key}-key="cpass sshkey/${key} ; ssh-add -t 36000 ~/.ssh/id_rsa.4096.${key}"
done


