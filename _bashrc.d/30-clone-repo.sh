clonerepo()  { mkdir -p ~/git/$1; cd ~/git/$1; git clone $2; }
_clonerepo_complete()
{
  local cur prev

  COMPREPLY=()
  cur=${COMP_WORDS[COMP_CWORD]}
  prev=${COMP_WORDS[COMP_CWORD-1]}

  if [ $COMP_CWORD -eq 1 ]; then
    COMPREPLY=( $(compgen -W "$(basename ~/git/*)" -- $cur) )
  fi
}
  
complete -F _clonerepo_complete clonerepo
