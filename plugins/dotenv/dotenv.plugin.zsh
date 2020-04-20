## Settings

# Filename of the dotenv file to look for
: ${ZSH_DOTENV_FILE:=.env}

# Path to the file containing allowed paths
: ${ZSH_DOTENV_ALLOWED_LIST:="${ZSH_CACHE_DIR:-$ZSH/cache}/dotenv-allowed.list"}


## Functions

source_env() {
  if [[ -f $ZSH_DOTENV_FILE ]]; then
<<<<<<< HEAD
    # test .env syntax
    zsh -fn $ZSH_DOTENV_FILE || echo "dotenv: error when sourcing '$ZSH_DOTENV_FILE' file" >&2

    if [[ -o a ]]; then
      source $ZSH_DOTENV_FILE
    else
      set -a
      source $ZSH_DOTENV_FILE
      set +a
=======
    if [[ "$ZSH_DOTENV_PROMPT" != false ]]; then
      local confirmation dirpath="${PWD:A}"

      # make sure there is an allowed file
      touch "$ZSH_DOTENV_ALLOWED_LIST"

      # check if current directory's .env file is allowed or ask for confirmation
      if ! grep -q "$dirpath" "$ZSH_DOTENV_ALLOWED_LIST" &>/dev/null; then
        # print same-line prompt and output newline character if necessary
        echo -n "dotenv: found '$ZSH_DOTENV_FILE' file. Source it? ([Y]es/[n]o/[a]lways) "
        read -k 1 confirmation; [[ "$confirmation" != $'\n' ]] && echo

        # check input
        case "$confirmation" in
          [nN]) return ;;
          [aA]) echo "$dirpath" >> "$ZSH_DOTENV_ALLOWED_LIST" ;;
          *) ;; # interpret anything else as a yes
        esac
      fi
>>>>>>> 31eca46ee3b94ca84a038628e0bf6089a7488908
    fi

    # test .env syntax
    zsh -fn $ZSH_DOTENV_FILE || echo "dotenv: error when sourcing '$ZSH_DOTENV_FILE' file" >&2

    setopt localoptions allexport
    source $ZSH_DOTENV_FILE
  fi
}

autoload -U add-zsh-hook
add-zsh-hook chpwd source_env

if [[ -z $ZSH_DOTENV_FILE ]]; then
    ZSH_DOTENV_FILE=.env
fi

source_env
