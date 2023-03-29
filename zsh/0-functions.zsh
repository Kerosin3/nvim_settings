
# add $1 in front of that path if it is not already in
pathadd_pre() {
  new="${1:A}"
  if [ -d "${new}" ]; then
    if [[ ":${PATH}:" != *":${new}:"* ]]; then
      PATH="${new}:${PATH}"
    fi
  fi
}

pathadd_post(){
  new="${1:A}"
  if [ -d "${new}" ]; then
    if [[ ":${PATH}:" != *":${new}:"* ]]; then
      PATH="${PATH}:${new}"
    fi
  fi
}
frepl() {
  if [ $# -lt 2 ]
  then
    echo "Usage: $funcstack[1] <search_pattern> <replace_string>"
    return
  fi

  echo "searching: [$1]"
  echo "replacing with: [$2]"
  rg "$1"
  printf "Replace? (y/n)"
	read yn
            case $yn in
                [Yy]* ) rg "$1" -l | xargs -d "\n" sed -i "s/$1/$2/g";;
                [Nn]* ) echo "aborted!";;
                * ) echo "Please answer yes or no.";;
            esac

}

## check if given command exists on the system
command_exists() { (( $+commands[$1] )) }
