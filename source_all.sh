SFUNCTIONS="shell_functions.sh"
SALIASES=".bash_aliases"

SOURCED=("$SFUNCTIONS" "$SALIASES")
for FILENAME in ${SOURCED[@]}; do
  [[ -f "$FILENAME" ]] && {
    source "$FILENAME";
    echo "Sourcing $FILENAME"
  }
done