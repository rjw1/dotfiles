check_new_dns() { curl --resolve *:80:$1 --resolve *:443:$1 $2 $3; }
