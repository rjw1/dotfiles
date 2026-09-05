export PATH="/opt/homebrew/opt/curl/bin:$PATH"

export LDFLAGS="-L/opt/homebrew/opt/curl/lib"
export CPPFLAGS="-I/opt/homebrew/opt/curl/include"

export PKG_CONFIG_PATH="/opt/homebrew/opt/curl/lib/pkgconfig"
alias curltime='curl -w "\nDNS: %{time_namelookup}s\nTCP: %{time_connect}s\nTLS: %{time_appconnect}s\nTTFB: %{time_starttransfer}s\nTotal: %{time_total}s\n" -o /dev/null -s'
