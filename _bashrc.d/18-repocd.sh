repo() { z ~/git/$1/$2; }
_repo_complete() {
  local cur prev

  COMPREPLY=()
  cur=${COMP_WORDS[COMP_CWORD]}
  prev=${COMP_WORDS[COMP_CWORD - 1]}

  if [ $COMP_CWORD -eq 1 ]; then
    COMPREPLY=($(compgen -W "$(basename ~/git/*)" -- $cur))
  elif [ $COMP_CWORD -eq 2 ]; then
    case "$prev" in
    "rjw1")
      COMPREPLY=($(compgen -W "$(basename ~/git/rjw1/*)" -- $cur))
      ;;
    "dxw")
      COMPREPLY=($(compgen -W "$(basename ~/git/dxw/*)" -- $cur))
      ;;
    "alphagov")
      COMPREPLY=($(compgen -W "$(basename ~/git/alphagov/*)" -- $cur))
      ;;
    *) ;;
    esac
  fi
}

complete -F _repo_complete repo
