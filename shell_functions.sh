#!/usr/bin/zsh

# FUNCTIONS
paste-up() {
    local DOMAIN="https://paste.c-net.org/"

    # ARG1: Local Path
    [[ -f $1 ]] && {
	local FILE="$1";
	local FILE_OWNER=$(stat -c '%U' "$1");
    } || {
	echo "Failed. File does not exist.";
	exit 1;
    }

    [[ "$FILE_OWNER" == "$USER" ]] && {
        local output=$(curl --upload-file $FILE $DOMAIN)
        echo $output
    } || {
	echo "Failed. $FILE does not belong to $USER.";
	exit 1;
    }



}

# Return a ansi color code from a string
ansi-color() {
  case $1 in
    black)
      local color="30"
      ;;
    red)
      local color="31"
      ;;
    green)
      local color="32"
      ;;
    yellow)
      local color="33"
      ;;
    blue)
      local color="34"
      ;;
    magenta)
      local color="35"
      ;;
    cyan)
      local color="36"
      ;;
    white)
      local color="37"
      ;;
    *)
      local color=""
      ;;
  esac
  echo "$color"
}

# Determine shell in use
check-shell() {
  [[ "$SHELL" == *"zsh"* ]] && local shell="zsh"
  [[ "$SHELL" == *"bash"* ]] && local shell="bash"
  if [ ! $shell == '' ];then
    echo $shell
  else
    exit 1
  fi
}

# Log Exit Statuses
# Use set -v with this command, such as `set -v;cat does_not_exist | lex`
lex() {
  # ARG1 Message
  [[ "$1" == '' ]] && MSG="No message provided" || MSG="$1"

  # ARG2 Status Code: default 1
  [[ "$2" == '' ]] && STATUS='1' || STATUS="$2"

  # ARG3 Color: optional
  shell=$(check-shell)
  case $shell in
    bash)
      COLOR="${3,,}"
      ;;
    zsh)
      COLOR="${3:l}"
      ;;
    *)
      COLOR="$3"
      ;;
  esac

  COLOR=$(ansi-color "$COLOR")

  # Debug Message to Color Code
  [[ "$STATUS" == '0' ]] && MSG_TYPE="SUCCESS" || MSG_TYPE="ERROR"
  echo -e "\033[$COLOR;1;4m$MSG_TYPE:\033[0m returned $STATUS\n\t'$MSG'\n"
}