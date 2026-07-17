# Instant prompt
typeset -g POWERLEVEL9K_INSTANT_PROMPT=quiet
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Exports
export ZSH="$HOME/.oh-my-zsh"
export PATH="$HOME/.local/bin:$HOME/go/bin:$PATH"
export EDITOR='nvim'


setopt AUTO_CD          # переход в папку без cd
setopt CORRECT          # автоисправление опечаток
setopt EXTENDED_GLOB    # расширенные шаблоны для glob

# Theme
# ZSH_THEME="ys"

# Plugins
plugins=(
    extract
    fzf
    fzf-tab
    sudo
    zsh-autopair
    zsh-interactive-cd
    zsh-autosuggestions
    zsh-syntax-highlighting
    colored-man-pages
    command-not-found
)

# Aliases
alias update='sudo pacman -Syu'
alias y='yazi'
alias ff="fastfetch"
alias off="poweroff"

HISTSIZE=10000
SAVEHIST=10000
setopt SHARE_HISTORY
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE   # не сохранять команды, начинающиеся с пробела
setopt HIST_FIND_NO_DUPS   # не показывать дубли при поиске

# Source oh-my-zsh
source $ZSH/oh-my-zsh.sh

eval "ff"
# Starship prompt
eval "$(starship init zsh)"