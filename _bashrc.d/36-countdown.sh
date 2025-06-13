countdown() {
  start="$(($(gdate '+%s') + $1))"
  while [ $start -ge $(gdate +%s) ]; do
    time="$(($start - $(gdate +%s)))"
    printf '%s\r' "$(gdate -u -d "@$time" +%H:%M:%S)"
    sleep 0.1
  done
}
