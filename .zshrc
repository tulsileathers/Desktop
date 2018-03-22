# username that determines your Users/username path
username="jonathanadmin"
# Path to your oh-my-zsh installation.
export ZSH=/Users/${username}/.oh-my-zsh

# Set name of the theme to load.
ZSH_THEME="agnoster-fcamblor"

# Uncomment the following line to disable auto-setting terminal title.
export DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
HIST_STAMPS="mm/dd/yyyy"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(rails docker ruby javascript git zsh-nvm zsh-better-npm-completion)

source $ZSH/oh-my-zsh.sh

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Cool Navigation featurettes
source /Users/${username}/z.sh

# Easily switch iTerm's Tab Colors
function color {
    case $1 in
    red)
    echo -e "\033]6;1;bg;red;brightness;270\a"
    echo -e "\033]6;1;bg;green;brightness;60\a"
    echo -e "\033]6;1;bg;blue;brightness;83\a"
    ;;
    yellow)
    echo -e "\033]6;1;bg;red;brightness;255\a"
    echo -e "\033]6;1;bg;green;brightness;255\a"
    echo -e "\033]6;1;bg;blue;brightness;0\a"
    ;;
    blue)
    echo -e "\033]6;1;bg;red;brightness;20\a"
    echo -e "\033]6;1;bg;green;brightness;50\a"
    echo -e "\033]6;1;bg;blue;brightness;255\a"
    ;;
    purple)
    echo -e "\033]6;1;bg;red;brightness;186\a"
    echo -e "\033]6;1;bg;green;brightness;85\a"
    echo -e "\033]6;1;bg;blue;brightness;211\a"
    ;;
    green)
    echo -e "\033]6;1;bg;red;brightness;0\a"
    echo -e "\033]6;1;bg;green;brightness;255\a"
    echo -e "\033]6;1;bg;blue;brightness;0\a"
    ;;
    esac
 }

# Easily switch iTerm's Tab Title
function title {
    echo -ne "\033]0;"$*"\007"
}
DEFAULT_USER=username
prompt_context(){}
