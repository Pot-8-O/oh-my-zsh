# Looks for a gradlew file in the current working directory
# or any of its parent directories, and executes it if found.
# Otherwise it will call gradle directly.
function gradle-or-gradlew() {
  # find project root
  # taken from https://github.com/gradle/gradle-completion
  local dir="$PWD" project_root="$PWD"
  while [[ "$dir" != / ]]; do
    if [[ -f "$dir/settings.gradle" || -f "$dir/settings.gradle.kts" || -f "$dir/gradlew" ]]; then
      project_root="$dir"
      break
    fi
    dir="${dir:h}"
  done

  # if gradlew found, run it instead of gradle
  if [[ -f "$project_root/gradlew" ]]; then
    echo "executing gradlew instead of gradle"
    "$project_root/gradlew" "$@"
  else
    command gradle "$@"
  fi
}

<<<<<<< HEAD

##############################################################################
# Register the completions against the gradle and gradlew commands
############################################################################
compdef _gradle_tasks gradle
compdef _gradlew_tasks gradlew
compdef _gradlew_tasks gw
=======
alias gradle=gradle-or-gradlew
compdef _gradle gradle-or-gradlew
>>>>>>> 31eca46ee3b94ca84a038628e0bf6089a7488908
