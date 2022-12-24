note()  { cd ~/dxw/$1; }
_note_complete()
{
  local cur prev

  COMPREPLY=()
  cur=${COMP_WORDS[COMP_CWORD]}
  prev=${COMP_WORDS[COMP_CWORD-1]}

  if [ $COMP_CWORD -eq 1 ]; then
    COMPREPLY=( $(compgen -W "$(basename ~/dxw/*)" -- $cur) )
  fi
}
  
complete -F _note_complete note
