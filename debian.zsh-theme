# AX-ZSH: Eivs' Modular ZSH Configuration
# debian.zsh-theme: Debian theme

# Prompt
ZSH_THEME_PROMPT="$"
ZSH_THEME_PROMPT_ROOT="#"
ZSH_THEME_PROMPT_PREFIX_SPACING=""
ZSH_THEME_PROMPT_PREFIX=""
ZSH_THEME_PROMPT_ROOT_PREFIX=""
ZSH_THEME_PROMPT_SUFFIX=""
ZSH_THEME_PROMPT_SUFFIX_SPACING=" "

# VCS
ZSH_THEME_VCS_PROMPT_PREFIX_SPACING="("
ZSH_THEME_VCS_PROMPT_PREFIX="%{$fg_no_bold[yellow]%}"
ZSH_THEME_VCS_PROMPT_SUFFIX="%{$fg[default]%}"
ZSH_THEME_VCS_PROMPT_SUFFIX_SPACING=")"
ZSH_THEME_VCS_PROMPT_CLEAN=" %{$fg_no_bold[green]%}$clean%{$fg[default]%}"
ZSH_THEME_VCS_PROMPT_DIRTY=" %{$fg_no_bold[red]%}$dirty%{$fg[default]%}"
ZSH_THEME_VCS_PROMPT_AHEAD="%{$fg_no_bold[cyan]%}$ahead%{$fg[default]%}"
ZSH_THEME_VCS_PROMPT_BEHIND="%{$fg_no_bold[blue]%}$behind%{$fg[default]%}"

function zsh_prompt() {
	local p
	(( $UID == 0 )) \
		&& p="${ZSH_THEME_PROMPT_ROOT_PREFIX}${ZSH_THEME_PROMPT_ROOT}" \
		|| p="${ZSH_THEME_PROMPT_PREFIX}${ZSH_THEME_PROMPT}"
	echo "${ZSH_THEME_PROMPT_PREFIX_SPACING}${p}${ZSH_THEME_PROMPT_SUFFIX}${ZSH_THEME_PROMPT_SUFFIX_SPACING}"
}

function zsh_vcs_prompt() {
	local func
	local p
	for func ($zsh_vcs_prompt_functions); do
		p=$( $func ) || continue
		echo "${ZSH_THEME_VCS_PROMPT_PREFIX_SPACING}${p}${ZSH_THEME_VCS_PROMPT_SUFFIX_SPACING}"
		return
	done
}

zsh_vcs_prompt_functions=()

PROMPT="%{$fg_bold[green]%}%n@%m%{$reset_color%}:%{$fg_bold[blue]%}%~%{$reset_color%}"'$(zsh_vcs_prompt)'"$(zsh_prompt)"
