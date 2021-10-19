# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Set name of the theme to load.
#ZSH_THEME="jpry"
ZSH_THEME="powerlevel10k/powerlevel10k"

# Custom ZSH plugins/themes
if [[ -d "$HOME/dotfiles/zsh-custom" ]]; then
    ZSH_CUSTOM="$HOME/dotfiles/zsh-custom"
fi

# Powerlevel configuration
#POWERLEVEL9K_PROMPT_ON_NEWLINE=true
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(context dir newline vcs)

# Uncomment the following line to use hyphen-insensitive completion.
HYPHEN_INSENSITIVE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

# Which plugins would you like to load?
plugins=(git brew git-extras git-prompt github composer)

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
    export EDITOR='nano'
else
    export EDITOR='nano'
fi

# Load custom files
for file in ~/.{path,exports,aliases,functions,extra}; do
    [ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;

# ZSH options
setopt nopushdminus
setopt appendhistory
setopt clobber
unsetopt AUTO_PUSHD

# Load pyenv
if which pyenv > /dev/null; then
    export PYENV_ROOT="$HOME/.pyenv"
    export PATH="$PYENV_ROOT/bin:$PATH"
    eval "$(pyenv init --path)"
    eval "$(pyenv init -)"
    eval "$(pyenv virtualenv-init -)"
fi

# Load rbenv
if which rbenv > /dev/null; then 
    eval "$(rbenv init -)"
fi

# Load nvm
export NVM_DIR="$HOME/.nvm"
[ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"
[ -s "/usr/local/opt/nvm/etc/bash_completion" ] && . "/usr/local/opt/nvm/etc/bash_completion"

if [[ -d "$HOME/projects/Go" ]]; then
    export GOPATH="$HOME/projects/Go"
fi

# twilio autocomplete setup
TWILIO_AC_ZSH_SETUP_PATH=/Users/jpry/.twilio-cli/autocomplete/zsh_setup && test -f $TWILIO_AC_ZSH_SETUP_PATH && source $TWILIO_AC_ZSH_SETUP_PATH;

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
if [[ -f ~/.p10k.zsh ]]; then
    source ~/.p10k.zsh
fi
