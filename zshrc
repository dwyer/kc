# Set up the prompt
autoload -Uz promptinit
promptinit
#prompt adam1

setopt histignorealldups sharehistory

# Use emacs keybindings even if our EDITOR is set to vi
bindkey -e

# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=1000
SAVEHIST=1000

# Use modern completion system
autoload -Uz compinit
compinit

setopt bash_autolist
#zstyle ':completion:*' auto-description 'specify: %d'
#zstyle ':completion:*' completer _expand _complete
#zstyle ':completion:*' completer _expand _complete _correct _approximate
#zstyle ':completion:*' format 'Completing %d'
#zstyle ':completion:*' group-name ''
#zstyle ':completion:*' menu select=2
#eval "$(dircolors -b)"
#zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
#zstyle ':completion:*' list-colors ''
#zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
#zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
#zstyle ':completion:*' menu select=long
#zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
#zstyle ':completion:*' squeeze-slashes true
#zstyle ':completion:*' use-compctl false
#zstyle ':completion:*' verbose false

#zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
#zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'

# alt+left/right to move between words in Gnome Terminal
bindkey ';5C' emacs-forward-word
bindkey ';5D' emacs-backward-word

# option+left/right to move between words in iTerm2
bindkey ';9C' emacs-forward-word
bindkey ';9D' emacs-backward-word
bindkey '[C' emacs-forward-word
bindkey '[D' emacs-backward-word

# ctrl+U deletes everything to the left of the cursor instead of the whole line
bindkey '^U' backward-kill-line

# load options shared between bash and zsh
source ~/.profile

# custom prompt
setopt prompt_subst
autoload -Uz vcs_info
zstyle ':vcs_info:*' actionformats '[%b|%a] '
zstyle ':vcs_info:*' formats       '[%b] '
zstyle ':vcs_info:(sv[nk]|bzr):*' branchformat '%b:%r'
precmd () { vcs_info }
PROMPT='%n@%m %3~ ${vcs_info_msg_0_}%# '
RPROMPT='[%D %*]'
