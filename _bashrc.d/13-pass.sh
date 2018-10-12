alias cpass="pass -c"
alias gpass="pass generate -c"
complete -o filenames -F _pass cpass gpass
export PASSWORD_STORE_GENERATED_LENGTH='16'
