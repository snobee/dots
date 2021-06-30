# plugins
# ------------------------------------------------------------------------------
# export DISPLAY=""
if [[ ! -d ~/.zplug ]];then
    git clone https://github.com/b4b4r07/zplug ~/.zplug
fi
source ~/.zplug/init.zsh

# clipboard
export ZSH_SYSTEM_CLIPBOARD_USE_WL_CLIPBOARD
# zplug "kutsan/zsh-system-clipboard"
zplug "dylantjb/zsh-system-clipboard", at:patch-1 # needed for wayland until the PR is merged

# vim mode
zplug "softmoth/zsh-vim-mode"

if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi
zplug load

# alias
# ------------------------------------------------------------------------------
alias ls="ls --color -l"
alias la="ls -a"
alias clr=clear
alias rr=ranger
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."

# vim
# ------------------------------------------------------------------------------
export KEYTIMEOUT=10                                # timeoutlen centiseconds

leader=" "
autoload -U edit-command-line                       # open command in vim
zle -N edit-command-line
bindkey  -M vicmd   ' '         edit-command-line
bindkey  -M viins   'kl'        vi-cmd-mode         # back to normal mode
bindkey  -M viins   'lk'        vi-cmd-mode
bindkey  -M viins   'KL'        vi-cmd-mode
bindkey  -M viins   'LK'        vi-cmd-mode
bindkey -sM viins   '^T'        '^[viw~ea'          # toggle caps
bindkey -sM vicmd   '^T'        'viw~e'
bindkey -sM vicmd   'L'         'xp'                # shift character right
bindkey -sM vicmd   'H'         'xhP'
bindkey -sM vicmd   $leader'i'  'i?^[r'             # insert single character
bindkey -sM vicmd   $leader'a'  'a?^[r'
bindkey -sM vicmd   $leader'o'  'o^['               # insert blank line
bindkey -sM vicmd   $leader'O'  'O^['
bindkey -sM visual  '^M'        '^['                # exit visual with return

# completion
# ------------------------------------------------------------------------------
zstyle ':completion:*' completer _expand _complete _ignored _approximate
zstyle ':completion:*' matcher-list 'm:{[:lower:]}={[:upper:]} r:|[._-]=* r:|=*' \
    'm:{[:lower:]}={[:upper:]}' '' 'm:{[:lower:]}={[:upper:]}'
zstyle ':completion:*' use-compctl false
zstyle :compinstall filename '$HOME/.zshrc'

autoload -Uz compinit
compinit

# Customization
# ------------------------------------------------------------------------------
# Color palette taken from vim-airline-bubblegum
         GUI_DARK_GRAY='#303030'
       GUI_MED_GRAY_HI='#444444'
       GUI_MED_GRAY_LO='#3a3a3a'
        GUI_LIGHT_GRAY='#b2b2b2'
             GUI_GREEN='#afd787'
              GUI_BLUE='#87afd7'
            GUI_PURPLE='#afafd7'
            GUI_ORANGE='#d7af5f'
               GUI_RED='#d78787'
              GUI_PINK='#d7afd7'
       CTERM_DARK_GRAY=236
     CTERM_MED_GRAY_HI=238
     CTERM_MED_GRAY_LO=237
      CTERM_LIGHT_GRAY=249
           CTERM_GREEN=150
            CTERM_BLUE=110
          CTERM_PURPLE=146
          CTERM_ORANGE=179
             CTERM_RED=174
            CTERM_PINK=182
  MODE_INDICATOR_VIINS="%B%F{$CTERM_BLUE}INSERT%b%f"
MODE_INDICATOR_REPLACE="%B%F{$CTERM_RED}REPLACE%b%f"
  MODE_INDICATOR_VICMD="%B%F{$CTERM_GREEN}NORMAL%b%f"
 MODE_INDICATOR_SEARCH="%B%F{$CTERM_PURPLE}SEARCH%b%f"
 MODE_INDICATOR_VISUAL="%B%F{$CTERM_PINK}VISUAL%b%f"
  MODE_INDICATOR_VLINE="%B%F{$CTERM_PINK}V-LINE%b%f"
     MODE_CURSOR_VIINS="$GUI_BLUE blinking bar"
   MODE_CURSOR_REPLACE="$GUI_RED ff0000 steady underline"
     MODE_CURSOR_VICMD="$GUI_GREEN steady block"
    MODE_CURSOR_SEARCH="$GUI_PURPLE steady underline"
    MODE_CURSOR_VISUAL="$GUI_PINK steady block"
     MODE_CURSOR_VLINE="$GUI_PINK steady block"

# expands functions in prompt
setopt PROMPT_SUBST
 PROMPT=' %F{$CTERM_PURPLE}%n%f [${MODE_INDICATOR_PROMPT}] %F{$CTERM_RED}>%f '
RPROMPT=' %F{$CTERM_RED}<%f %F{$CTERM_PURPLE%~%f'
