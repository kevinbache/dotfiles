#!/usr/bin/env bash

# Shell prompt based on the Solarized Dark theme.
# Screenshot: http://i.imgur.com/EkEtphC.png
# Heavily inspired by @necolas’s prompt: https://github.com/necolas/dotfiles
# iTerm → Profiles → Text → use 13pt Monaco with 1.1 vertical spacing.

if [[ $COLORTERM = gnome-* && $TERM = xterm ]] && infocmp gnome-256color >/dev/null 2>&1; then
	export TERM='gnome-256color';
elif infocmp xterm-256color >/dev/null 2>&1; then
	export TERM='xterm-256color';
fi;

prompt_git() {
	local s='';
	local branchName='';

	# Check if the current directory is in a Git repository.
	if [ $(git rev-parse --is-inside-work-tree &>/dev/null; echo "${?}") == '0' ]; then

		# check if the current directory is in .git before running git checks
		if [ "$(git rev-parse --is-inside-git-dir 2> /dev/null)" == 'false' ]; then

			# Ensure the index is up to date.
			git update-index --really-refresh -q &>/dev/null;

			# Check for uncommitted changes in the index.
			if ! $(git diff --quiet --ignore-submodules --cached); then
				s+='+';
			fi;

			# Check for unstaged changes.
			if ! $(git diff-files --quiet --ignore-submodules --); then
				s+='!';
			fi;

			# Check for untracked files.
			if [ -n "$(git ls-files --others --exclude-standard)" ]; then
				s+='?';
			fi;

			# Check for stashed files.
			if $(git rev-parse --verify refs/stash &>/dev/null); then
				s+='$';
			fi;

		fi;

		# Get the short symbolic ref.
		# If HEAD isn’t a symbolic ref, get the short SHA for the latest commit
		# Otherwise, just give up.
		branchName="$(git symbolic-ref --quiet --short HEAD 2> /dev/null || \
			git rev-parse --short HEAD 2> /dev/null || \
			echo '(unknown)')";

		[ -n "${s}" ] && s=" [${s}]";

		echo -e "${1}${branchName}${2}${s}";
	else
		return;
	fi;
}

if tput setaf 1 &> /dev/null; then
# see https://unix.stackexchange.com/questions/269077/tput-setaf-color-table-how-to-determine-color-codes
	tput sgr0; # reset colors
	bold=$(tput bold);
	reset=$(tput sgr0);

	black=$(tput setaf 0);
	darkgrey=$(tput setaf 244);
        grey=$(tput setaf 7);
	white=$(tput setaf 15);

	violet=$(tput setaf 61);
        purple=$(tput setaf 125);
	blue=$(tput setaf 33);
	cyan=$(tput setaf 37);
	green=$(tput setaf 64);
	yellow=$(tput setaf 220);
	orange=$(tput setaf 166);
	red=$(tput setaf 160);
else
# these haven't been edited for parody with the tput colors
	bold='';
	reset="\e[0m";
	black="\e[1;30m";
	blue="\e[1;34m";
	cyan="\e[1;36m";
	green="\e[1;32m";
	orange="\e[1;33m";
	purple="\e[1;35m";
	red="\e[1;31m";
	violet="\e[1;35m";
	white="\e[1;37m";
        grey="\e[0;37m";
	yellow="\e[1;33m";
fi;

# Highlight the user name when logged in as root.
if [[ "${USER}" == "root" ]]; then
	userStyle="${red}";
else
	userStyle="${orange}";
fi;

# Highlight the hostname when connected via SSH.
if [[ "${SSH_TTY}" ]]; then
	hostStyle="${yellow}";
else
	hostStyle="${yellow}";
fi;

# Set the terminal title and prompt.
#PS1="\[\033]0;\W\007\]"; # working directory base name
#PS1+="\[${bold}\]\n"; # newline

PS1="\n"
PS1+="\[${reset}\]\[${darkgrey}\](\t) ";    # time
PS1+="\[${bold}\]\[${userStyle}\]\u ";      # username
PS1+="\[${reset}\]\[${darkgrey}\]at ";   
PS1+="\[${bold}\]\[${hostStyle}\]\h ";      # host
PS1+="\[${reset}\]\[${darkgrey}\]in ";   
PS1+="\[${bold}\]\[${green}\]\w ";          # working directory full path
PS1+="\$(prompt_git \"\[${reset}\]\[${darkgrey}\]on \[${bold}\]\[${blue}\]\" \"\[${bold}\]\[${blue}\]\")"; # Git repository details
PS1+="\n";
PS1+="\[${reset}\]\[${darkgrey}\]\$\[${reset}\] "; # `$` (and reset color)
export PS1;

PS2="\[${yellow}\]→ \[${reset}\]";
export PS2;
