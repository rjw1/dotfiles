for key in github personal gitlab dxw govpress
do
  alias add-ed25519-${key}-key="cpass sshkey/${key} ; ssh-add -t 36000 ~/.ssh/id_ed25519.${key}"
done


