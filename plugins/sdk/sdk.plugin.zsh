### SDKMAN Autocomplete for Oh My Zsh

# This is the output from sdkman. All the these options are supported at the
# moment.

# Usage: sdk <command> [candidate] [version]
#        sdk offline <enable|disable>
#
#    commands:
<<<<<<< HEAD
#        install   or i    <candidate> [version]
#        uninstall or rm   <candidate> <version>
#        list      or ls   [candidate]
#        use       or u    <candidate> [version]
=======
#        install   or i    <candidate> [version] [local-path]
#        uninstall or rm   <candidate> <version>
#        list      or ls   [candidate]
#        use       or u    <candidate> <version>
>>>>>>> 31eca46ee3b94ca84a038628e0bf6089a7488908
#        default   or d    <candidate> [version]
#        current   or c    [candidate]
#        upgrade   or ug   [candidate]
#        version   or v
#        broadcast or b
#        help      or h
#        offline           [enable|disable]
#        selfupdate        [force]
#        update
<<<<<<< HEAD
#        flush             <candidates|broadcast|archives|temp>
=======
#        flush             <broadcast|archives|temp>
>>>>>>> 31eca46ee3b94ca84a038628e0bf6089a7488908
#
#    candidate  :  the SDK to install: groovy, scala, grails, gradle, kotlin, etc.
#                  use list command for comprehensive list of candidates
#                  eg: $ sdk list
<<<<<<< HEAD
#
#    version    :  where optional, defaults to latest stable if not provided
#                  eg: $ sdk install groovy
=======
#    version    :  where optional, defaults to latest stable if not provided
#                  eg: $ sdk install groovy
#    local-path :  optional path to an existing local installation
#                  eg: $ sdk install groovy 2.4.13-local /opt/groovy-2.4.13
>>>>>>> 31eca46ee3b94ca84a038628e0bf6089a7488908

local _sdk_commands=(
    install     i
    uninstall   rm
    list        ls
    use         u
    default     d
    current     c
    upgrade     ug
    version     v
    broadcast   b
    help        h
    offline
    selfupdate
    update
    flush
)

_listInstalledVersions() {
  __sdkman_build_version_csv $1 | sed -e "s/,/ /g"
}

_listInstallableVersions() {
<<<<<<< HEAD
  __sdkman_list_versions $1 | grep "^ " | sed -e "s/\* /*/g" | \
      sed -e "s/>//g" | xargs -n 1 echo | grep -v "^*"
}

_listAllVersion() {
  __sdkman_list_versions $1 | grep "^ " | sed -e "s/\*/ /g" | sed -e "s/>//g"
=======
  # Remove local (+) and installed (*) versions from the list
  __sdkman_list_versions $1 | sed -e '/^[^ ]/d;s/[+*] [^ ]\+//g;s/>//g'
}

_listAllVersion() {
  # Remove (*), (+), and (>) characters from the list
  __sdkman_list_versions $1 | sed -e '/^[^ ]/d;s/[*+>] //g'
>>>>>>> 31eca46ee3b94ca84a038628e0bf6089a7488908
}

_sdk () {
  case $CURRENT in
    2)  compadd -- $_sdk_commands ;;
    3)  case "$words[2]" in
          i|install|rm|uninstall|ls|list|u|use|d|default|c|current|ug|upgrade)
                      compadd -- $SDKMAN_CANDIDATES ;;
          offline)    compadd -- enable disable ;;
          selfupdate) compadd -- force ;;
<<<<<<< HEAD
          flush)      compadd -- candidates broadcast archives temp ;;
=======
          flush)      compadd -- broadcast archives temp ;;
>>>>>>> 31eca46ee3b94ca84a038628e0bf6089a7488908
        esac
        ;;
    4)  case "$words[2]" in
          rm|uninstall|d|default) compadd -- $(_listInstalledVersions $words[3]) ;;
          i|install)              compadd -- $(_listInstallableVersions $words[3]) ;;
          u|use)                  compadd -- $(_listAllVersion $words[3]) ;;
        esac
        ;;
  esac
}

compdef _sdk sdk
