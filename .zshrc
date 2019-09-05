# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH
 # Autoload the ZSH completion to avoid kubectl autocomplete error
autoload -U +X compinit && compinit
autoload -U +X bashcompinit && bashcompinit

# Path to your oh-my-zsh installation.
export ZSH="/Users/callum.anderson/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
  brew
  docker
  docker-compose
  colorize
  golang
  helm
  zsh-syntax-highlighting
  history-substring-search
  history-search-multi-word
  kubectl
  kube-ps1
  zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh

# User configuration

# Bindkeys for substring search
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

# Add krew for Kuberentes plugins
export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"

# Add exports for Linuxify
. ~/.linuxify

#  You may actually need to set your language
export LANG=en_US.UTF-8

# Setup PATH for golang
export PATH=$PATH:/usr/local/go/bin

# Setup path for python3
export PATH=$PATH:/usr/local/opt/python/libexec/bin

# Add better ls output
alias ls="ls -la --color=always"

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Aliases for kubens and kubectx
alias kns="kubens"
alias kcx="kubectx"

# quick function to decode kubernetes secrets
function decode_kubernetes_secret {
  kubectl get secret $@ -o json | jq '.data | map_values(@base64d)'
}
alias ds="decode_kubernetes_secret"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/callum.anderson/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/callum.anderson/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/callum.anderson/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/callum.anderson/google-cloud-sdk/completion.zsh.inc'; fi
if [ /usr/local/bin/kubectl ]; then source <(kubectl completion zsh); fi

export PATH="$HOME/.bin:$PATH"
