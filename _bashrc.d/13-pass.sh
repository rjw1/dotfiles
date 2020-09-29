alias cpass="pass -c"
alias gpass="pass generate -c"
alias totp="pass otp -c"
complete -o filenames -F _pass cpass gpass totp
export PASSWORD_STORE_GENERATED_LENGTH='32'
export PASSWORD_STORE_ENABLE_EXTENSIONS=true
