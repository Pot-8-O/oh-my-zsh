# af-magic.zsh-theme
# Repo: https://github.com/andyfleming/oh-my-zsh
# Direct Link: https://github.com/andyfleming/oh-my-zsh/blob/master/themes/af-magic.zsh-theme


<<<<<<< HEAD
# primary prompt
PROMPT='$FG[237]${(l.COLUMNS..-.)}%{$reset_color%}
$FG[032]%~\
$(git_prompt_info)$(hg_prompt_info) \
$FG[105]%(!.#.»)%{$reset_color%} '
PROMPT2='%{$fg[red]%}\ %{$reset_color%}'
RPS1='${return_code}'
=======
# settings
typeset +H return_code="%(?..%{$fg[red]%}%? ↵%{$reset_color%})"
typeset +H my_gray="$FG[237]"
typeset +H my_orange="$FG[214]"
>>>>>>> 31eca46ee3b94ca84a038628e0bf6089a7488908

# separator dashes size
function afmagic_dashes {
	[[ -n "${VIRTUAL_ENV-}" && -z "${VIRTUAL_ENV_DISABLE_PROMPT-}" && "$PS1" = \(* ]] \
		&& echo $(( COLUMNS - ${#VIRTUAL_ENV} - 3 )) \
		|| echo $COLUMNS
}

# primary prompt
PS1='$FG[237]${(l.$(afmagic_dashes)..-.)}%{$reset_color%}
$FG[032]%~$(git_prompt_info)$(hg_prompt_info) $FG[105]%(!.#.»)%{$reset_color%} '
PS2='%{$fg[red]%}\ %{$reset_color%}'
RPS1='${return_code}'

# right prompt
<<<<<<< HEAD
if type "virtualenv_prompt_info" > /dev/null
then
	RPROMPT='$FG[078]$(virtualenv_prompt_info)%{$reset_color%} $my_gray%n@%m%{$reset_color%}%'
else
	RPROMPT='$my_gray%n@%m%{$reset_color%}%'
fi
=======
(( $+functions[virtualenv_prompt_info] )) && RPS1+='$(virtualenv_prompt_info)'
RPS1+=' $my_gray%n@%m%{$reset_color%}%'
>>>>>>> 31eca46ee3b94ca84a038628e0bf6089a7488908

# git settings
ZSH_THEME_GIT_PROMPT_PREFIX="$FG[075]($FG[078]"
ZSH_THEME_GIT_PROMPT_CLEAN=""
ZSH_THEME_GIT_PROMPT_DIRTY="$my_orange*%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="$FG[075])%{$reset_color%}"

# hg settings
ZSH_THEME_HG_PROMPT_PREFIX="$FG[075]($FG[078]"
ZSH_THEME_HG_PROMPT_CLEAN=""
ZSH_THEME_HG_PROMPT_DIRTY="$my_orange*%{$reset_color%}"
ZSH_THEME_HG_PROMPT_SUFFIX="$FG[075])%{$reset_color%}"
<<<<<<< HEAD
=======

# virtualenv settings
ZSH_THEME_VIRTUALENV_PREFIX=" $FG[075]["
ZSH_THEME_VIRTUALENV_SUFFIX="]%{$reset_color%}"
>>>>>>> 31eca46ee3b94ca84a038628e0bf6089a7488908
