source ./shell_functions.sh

# source into python venv
alias venvp="source venv/bin/activate"

# Print my IP
alias ipget="curl ipinfo.io/ip"

# r -- exeute last command immediately
shell=$(check-shell)
[[ "$shell" == 'bash' ]] && alias r="fc -s"
