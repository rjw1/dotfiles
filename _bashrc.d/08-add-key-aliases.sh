for key in github personal gitlab dxw govpress
do
  alias add-${key}-key="SSH_ASKPASS_REQUIRE=force SSH_ASKPASS=\"/Users/bob/bin/${key}-sshkey-pass\" ssh-add -t 36000 ~/.ssh/id_ed25519.${key}"
  alias rsa-add-${key}-key="cpass sshkey/${key} ; ssh-add -t 36000 ~/.ssh/id_rsa.4096.${key}"
done


