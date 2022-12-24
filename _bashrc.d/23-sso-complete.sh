_AWS_SSO_UTIL_COMPLETE_SCRIPT_DIR=~/.local/share/aws-sso-util
_AWS_SSO_UTIL_COMPLETE_SCRIPT=$_AWS_SSO_UTIL_COMPLETE_SCRIPT_DIR/complete.sh
if which aws-sso-util > /dev/null; then
  mkdir -p $_AWS_SSO_UTIL_COMPLETE_SCRIPT_DIR
  ({ _AWS_SSO_UTIL_COMPLETE=source_bash aws-sso-util > $_AWS_SSO_UTIL_COMPLETE_SCRIPT.tmp ;
    mv $_AWS_SSO_UTIL_COMPLETE_SCRIPT.tmp $_AWS_SSO_UTIL_COMPLETE_SCRIPT; } &)
  if [ -f $_AWS_SSO_UTIL_COMPLETE_SCRIPT ]; then
    source $_AWS_SSO_UTIL_COMPLETE_SCRIPT
  fi
fi
