<<<<<<< HEAD
# easier alias to use the plugin
alias ccat='colorize_via_pygmentize'
alias cless='colorize_via_pygmentize_less'
=======
# Easier alias to use the plugin
alias ccat="colorize_cat"
alias cless="colorize_less"
>>>>>>> 31eca46ee3b94ca84a038628e0bf6089a7488908

# '$0:A' gets the absolute path of this file
ZSH_COLORIZE_PLUGIN_PATH=$0:A

colorize_check_requirements() {
    local available_tools=("chroma" "pygmentize")

    if [ -z "$ZSH_COLORIZE_TOOL" ]; then
        if (( $+commands[pygmentize] )); then
            ZSH_COLORIZE_TOOL="pygmentize"
        elif (( $+commands[chroma] )); then
            ZSH_COLORIZE_TOOL="chroma"
        else
            echo "Neither 'pygments' nor 'chroma' is installed!" >&2
            return 1
        fi
    fi

    if [[ ${available_tools[(Ie)$ZSH_COLORIZE_TOOL]} -eq 0 ]]; then
        echo "ZSH_COLORIZE_TOOL '$ZSH_COLORIZE_TOOL' not recognized. Available options are 'pygmentize' and 'chroma'." >&2
        return 1
    elif (( $+commands["$ZSH_COLORIZE_TOOL"] )); then
        echo "Package '$ZSH_COLORIZE_TOOL' is not installed!" >&2
        return 1
    fi
}

colorize_cat() {
    if ! colorize_check_requirements; then
        return 1
    fi

    # If the environment variable ZSH_COLORIZE_STYLE
    # is set, use that theme instead. Otherwise,
    # use the default.
    if [ -z "$ZSH_COLORIZE_STYLE" ]; then
        # Both pygmentize & chroma support 'emacs'
        ZSH_COLORIZE_STYLE="emacs"
    fi

<<<<<<< HEAD
    # If the environment varianle ZSH_COLORIZE_STYLE
    # is set, use that theme instead. Otherwise,
    # use the default.
    if [ -z $ZSH_COLORIZE_STYLE ]; then
        ZSH_COLORIZE_STYLE="default"
    fi

    # pygmentize stdin if no arguments passed
    if [ $# -eq 0 ]; then
        pygmentize -O style="$ZSH_COLORIZE_STYLE" -g
        return $?
    fi

    # guess lexer from file extension, or
    # guess it from file contents if unsuccessful

    local FNAME lexer
    for FNAME in "$@"
    do
        lexer=$(pygmentize -N "$FNAME")
        if [[ $lexer != text ]]; then
            pygmentize -O style="$ZSH_COLORIZE_STYLE" -l "$lexer" "$FNAME"
        else
            pygmentize -O style="$ZSH_COLORIZE_STYLE" -g "$FNAME"
=======
    # Use stdin if no arguments have been passed.
    if [ $# -eq 0 ]; then
        if [[ "$ZSH_COLORIZE_TOOL" == "pygmentize" ]]; then
            pygmentize -O style="$ZSH_COLORIZE_STYLE" -g
        else
            chroma --style="$ZSH_COLORIZE_STYLE"
        fi
        return $?
    fi

    # Guess lexer from file extension, or guess it from file contents if unsuccessful.
    local FNAME lexer
    for FNAME in "$@"; do
        if [[ "$ZSH_COLORIZE_TOOL" == "pygmentize" ]]; then
            lexer=$(pygmentize -N "$FNAME")
            if [[ $lexer != text ]]; then
                pygmentize -O style="$ZSH_COLORIZE_STYLE" -l "$lexer" "$FNAME"
            else
                pygmentize -O style="$ZSH_COLORIZE_STYLE" -g "$FNAME"
            fi
        else
            chroma --style="$ZSH_COLORIZE_STYLE" "$FNAME"
>>>>>>> 31eca46ee3b94ca84a038628e0bf6089a7488908
        fi
    done
}

<<<<<<< HEAD
colorize_via_pygmentize_less() (
    # this function is a subshell so tmp_files can be shared to cleanup function
    declare -a tmp_files 

    cleanup () {
        [[ ${#tmp_files} -gt 0 ]] && rm -f "${tmp_files[@]}"
        exit
    }
    trap 'cleanup' EXIT HUP TERM INT

    while (( $# != 0 )); do     #TODO: filter out less opts
        tmp_file="$(mktemp -t "tmp.colorize.XXXX.$(sed 's/\//./g' <<< "$1")")"
        tmp_files+=("$tmp_file")
        colorize_via_pygmentize "$1" > "$tmp_file"
        shift 1
    done
=======
# The less option 'F - Forward forever; like "tail -f".' will not work in this implementation
# caused by the lack of the ability to follow the file within pygmentize.
colorize_less() {
    if ! colorize_check_requirements; then
        return 1
    fi

    _cless() {
        # LESS="-R $LESS" enables raw ANSI colors, while maintain already set options.
        local LESS="-R $LESS"

        # This variable tells less to pipe every file through the specified command
        # (see the man page of less INPUT PREPROCESSOR).
        # 'zsh -ic "colorize_cat %s 2> /dev/null"' would not work for huge files like
        # the ~/.zsh_history. For such files the tty of the preprocessor will be supended.
        # Therefore we must source this file to make colorize_cat available in the
        # preprocessor without the interactive mode.
        # `2>/dev/null` will suppress the error for large files 'broken pipe' of the python
        # script pygmentize, which will show up if less has not fully "loaded the file"
        # (e.g. when not scrolled to the bottom) while already the next file will be displayed.
        local LESSOPEN="| zsh -c 'source \"$ZSH_COLORIZE_PLUGIN_PATH\"; \
        ZSH_COLORIZE_TOOL=$ZSH_COLORIZE_TOOL ZSH_COLORIZE_STYLE=$ZSH_COLORIZE_STYLE \
        colorize_cat %s 2> /dev/null'"

        # LESSCLOSE will be set to prevent any errors by executing a user script
        # which assumes that his LESSOPEN has been executed.
        local LESSCLOSE=""

        LESS="$LESS" LESSOPEN="$LESSOPEN" LESSCLOSE="$LESSCLOSE" less "$@"
    }
>>>>>>> 31eca46ee3b94ca84a038628e0bf6089a7488908

    if [ -t 0 ]; then
        _cless "$@"
    else
        # The input is not associated with a terminal, therefore colorize_cat will
        # colorize this input and pass it to less.
        # Less has now to decide what to use. If any files have been provided, less
        # will ignore the input by default, otherwise the colorized input will be used.
        # If files have been supplied and the input has been redirected, this will
        # lead to unnecessary overhead, but retains the ability to use the less options
        # without checking for them inside this script.
        colorize_cat | _cless "$@"
    fi
}
