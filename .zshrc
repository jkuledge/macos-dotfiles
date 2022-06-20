# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

plugins=(git)

################################################################################
## THEME.SH
################################################################################

# REMEMBER TERMINAL THEME
if command -v theme.sh > /dev/null; then
	[ -e ~/.theme_history ] && theme.sh "$(theme.sh -l|tail -n1)"

	# Optional

	last_theme() {
	}

	zle -N last_theme
	# Bind C-o to the last theme.
	bindkey '^O' last_theme

	alias th='theme.sh -i'

	# Interactively load a light theme
	alias thl='theme.sh --light -i'

	# Interactively load a dark theme
	alias thd='theme.sh --dark -i'
fi



################################################################################
## ALIASES
################################################################################

# GIT BARE REPOS
alias dot='/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME'

# RESTART SOUND DRIVER (MACOS)
alias restart_sound="sudo pkill -9 coreaudiod"

# CAT
alias cat="bat"

# GCLOUD
alias ssh_dry_run="gcloud compute ssh de-vm-jkuledge --project=og-developer-vms --zone=us-central1-c --tunnel-through-iap --dry-run"
alias ssh_vm="gcloud compute ssh de-vm-jkuledge --project=og-developer-vms --zone=us-central1-c --tunnel-through-iap"
alias start_vm="gcloud compute instances start de-vm-jkuledge --project=og-developer-vms --zone=us-central1-c"
alias stop_vm="gcloud compute instances stop de-vm-jkuledge --project=og-developer-vms --zone=us-central1-c"

# LSDELUXE
alias ls='lsd'
alias l='ls -l'
alias la='ls -a'
alias lla='ls -la'
alias lt='ls --tree'

# PYTHON
alias python='python3'
alias pip='pip3'

source $ZSH/oh-my-zsh.sh

# SHELL COLOR SCRIPTS
alias colorscript='/Users/josh.kuledge/programs/shell-color-scripts/colorscript.sh'

# KITTY SSH COPY TERM INFO TO SERVER WHEN SSH-ING
alias ssh="kitty +kitten ssh"

# HIGHLIGHT ACTIVE WINDOW
# alias highlight='/Users/josh.kuledge/.config/limelight/limelightrc'
# alias limelight="limelight -c /Users/josh.kuledge/.config/limelight/limelightrc"

################################################################################
## FUNCTIONS
################################################################################

function set_wallpaper() {
	local wall_path="$1"
	osascript -e "tell application \"System Events\" to set picture of every desktop to \"${wall_path}\" as POSIX file"
}

################################################################################
## MISC
################################################################################

# COLORSCIPT
colorscript -e crunchbang-mini
# neofetch --config ~/.config/neofetch/custom_config.conf


# ZSH PLUGINS
source ~/programs/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
# source ~/programs/zsh-autocomplete/zsh-autocomplete.plugin.zsh

source ~/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
export PATH="/opt/homebrew/opt/node@16/bin:$PATH"

# [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

