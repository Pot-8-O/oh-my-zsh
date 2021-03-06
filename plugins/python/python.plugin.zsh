# Find python file
alias pyfind='find . -name "*.py"'

# Remove python compiled byte-code and mypy/pytest cache in either the current
# directory or in a list of specified directories (including sub directories).
function pyclean() {
    ZSH_PYCLEAN_PLACES=${*:-'.'}
    find ${ZSH_PYCLEAN_PLACES} -type f -name "*.py[co]" -delete
    find ${ZSH_PYCLEAN_PLACES} -type d -name "__pycache__" -delete
    find ${ZSH_PYCLEAN_PLACES} -depth -type d -name ".mypy_cache" -exec rm -r "{}" +
    find ${ZSH_PYCLEAN_PLACES} -depth -type d -name ".pytest_cache" -exec rm -r "{}" +
<<<<<<< HEAD
=======
}

# Add the user installed site-packages paths to PYTHONPATH, only if the
#   directory exists. Also preserve the current PYTHONPATH value.
# Feel free to autorun this when .zshrc loads.
function pyuserpaths() {
    local targets=("python2" "python3")  # bins
    
    # Get existing interpreters.
    local interps=()
    for target in $targets; do
        [ `command -v $target` ] && interps+=($target)
    done

    # Check for a non-standard install directory.
    local user_base="${HOME}/.local"
    [ $PYTHONUSERBASE ] && user_base=$PYTHONUSERBASE

    # Add version specific paths, if:
    #   it exists in the filesystem;
    #   it isn't in PYTHONPATH already.
    for interp in $interps; do
        # Get minor release version.
        local ver=`$interp -V 2>&1`
        ver=`echo ${ver:7} | cut -d '.' -f 1,2`  # The patch version is variable length, truncate it.
        
        local site_pkgs="${user_base}/lib/python${ver}/site-packages"
        [[ -d $site_pkgs && ! $PYTHONPATH =~ $site_pkgs ]] && export PYTHONPATH=${site_pkgs}:$PYTHONPATH
    done
>>>>>>> 31eca46ee3b94ca84a038628e0bf6089a7488908
}

# Grep among .py files
alias pygrep='grep -r --include="*.py"'

# Run proper IPython regarding current virtualenv (if any)
alias ipython="python -c 'import IPython; IPython.terminal.ipapp.launch_new_instance()'"
