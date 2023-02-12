# Download Znap, if it's not there yet.
if [[ -f ~/code-monkey/zsh-snap/znap.zsh ]]; then
    git clone --depth 1 -- https://github.com/marlonrichert/zsh-snap.git ~/code-monkey/zsh-snap
fi
source ~/code-monkey/zsh-snap/zsh-snap/znap.zsh

znap eval starship 'starship init zsh --print-full-init'
znap prompt

znap source zsh-users/zsh-autosuggestions
znap source zsh-users/zsh-syntax-highlighting
znap source wfxr/forgit
znap source unixorn/fzf-zsh-plugin
znap source Aloxaf/fzf-tab
znap source trystan2k/zsh-tab-title
# znap source chriskempson/base16-shell
# znap eval chriskempson/base16-shell base16_monokai
# znap source marzocchi/zsh-notify
# zstyle ':notify:*' expire-time 25000

ZSH_TAB_TITLE_DEFAULT_DISABLE_PREFIX=true
# ZSH_TAB_TITLE_ONLY_FOLDER=true
ZSH_TAB_TITLE_CONCAT_FOLDER_PROCESS=true
ZSH_TAB_TITLE_ENABLE_FULL_COMMAND=true

# znap eval fzf 'curl -fsSL https://raw.githubusercontent.com/junegunn/fzf/master/shell/completion.zsh'
zstyle ':fzf-tab:complete:(-parameter-|-brace-parameter-|export|unset|expand):*' fzf-preview 'echo ${(P)word}'
zstyle ':fzf-tab:*' fzf-bindings 'tab:accept'
zstyle ':fzf-tab:*' continuous-trigger shift-tab
zstyle ':fzf-tab:*' accept-line enter
zstyle ':fzf-tab:*' fzf-flags --header="tab to accept and edit, enter to execute, shift+tab to continue completing, esc to cancel"

# preview directory's content with exa when completing cd
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'exa -1 --color=always $realpath'
zstyle ':completion:*:git-checkout:*' sort false
# set list-colors to enable filename colorizing
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
# set descriptions format to enable group support
zstyle ':completion:*:descriptions' format '[%d]'
# Case insensitive https://superuser.com/questions/1092033/how-can-i-make-zsh-tab-completion-fix-capitalization-errors-for-directories-and
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'

znap eval zoxide "zoxide init zsh"

export FORGIT_HELP=$(<<<'
Command 	Option
Enter 	Confirm
Tab 	Toggle mark and move up
Shift - Tab 	Toggle mark and move down
? 	Toggle preview window
Alt - W 	Toggle preview wrap
Ctrl - S 	Toggle sort
Ctrl - R 	Toggle selection
Ctrl - Y 	Copy commit hash*
Ctrl - K / P 	Selection move up
Ctrl - J / N 	Selection move down
Alt - K / P 	Preview move up
Alt - J / N 	Preview move down' | column -ts "$(printf '\t')") # instead of printf, can do $'\t'
export FORGIT_FZF_DEFAULT_OPTS="--reverse --header '${FORGIT_HELP}' --height '100%'"
export FORGIT_LOG_FORMAT='%C(auto)%h %C(green)%an%C(auto)%d %C(reset)%s %C(magenta)%C(bold)%cr%Creset'
export FORGIT_LOG_GRAPH_ENABLE=false

# Lines configured by zsh-newuser-install
export HISTFILE="${HOME}/.zsh_history"
export HISTSIZE=100000
export SAVEHIST=$HISTSIZE

forgit() {
    cat <<EOF | column -ts '|'
($(tput setaf 1)ga$(tput sgr0))|Interactive git add selector
($(tput setaf 1)glo$(tput sgr0))|Interactive git log viewer
($(tput setaf 1)gi$(tput sgr0))|Interactive .gitignore generator
($(tput setaf 1)gd$(tput sgr0))|Interactive git diff viewer
($(tput setaf 1)grh$(tput sgr0))|Interactive git reset HEAD <file> selector
($(tput setaf 1)gcf$(tput sgr0))|Interactive git checkout <file> selector
($(tput setaf 1)gcb$(tput sgr0))|Interactive git checkout <branch> selector
($(tput setaf 1)gbd$(tput sgr0))|Interactive git branch -D <branch> selector
($(tput setaf 1)gco$(tput sgr0))|Interactive git checkout <commit> selector
($(tput setaf 1)grc$(tput sgr0))|Interactive git revert <commit> selector 
($(tput setaf 1)gss$(tput sgr0))|Interactive git stash viewer
($(tput setaf 1)gsp$(tput sgr0))|Interactive git stash push selector 
($(tput setaf 1)gclean$(tput sgr0))|Interactive git clean selector
($(tput setaf 1)gcp$(tput sgr0))|Interactive git cherry-pick selector
($(tput setaf 1)grb$(tput sgr0))|Interactive git rebase -i selector
($(tput setaf 1)gbl$(tput sgr0))|Interactive git blame selector 
($(tput setaf 1)gfu$(tput sgr0))|Interactive git commit --fixup && git rebase -i --autosquash selector
EOF
}
 
# setopt BANG_HIST                 # Treat the '!' character specially during expansion.
setopt EXTENDED_HISTORY          # Write the history file in the ":start:elapsed;command" format.
setopt INC_APPEND_HISTORY        # Write to the history file immediately, not when the shell exits.
setopt SHARE_HISTORY             # Share history between all sessions.
setopt HIST_EXPIRE_DUPS_FIRST    # Expire duplicate entries first when trimming history.
setopt HIST_IGNORE_DUPS          # Don't record an entry that was just recorded again.
# setopt HIST_IGNORE_ALL_DUPS      # Delete old recorded entry if new entry is a duplicate.
setopt HIST_FIND_NO_DUPS         # Do not display a line previously found.
# setopt HIST_IGNORE_SPACE         # Don't record an entry starting with a space.
# setopt HIST_SAVE_NO_DUPS         # Don't write duplicate entries in the history file.
setopt HIST_REDUCE_BLANKS        # Remove superfluous blanks before recording entry.
setopt HIST_VERIFY               # Don't execute immediately upon history expansion.

bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
#
zstyle :compinstall filename '/home/stephen/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

# when deleting word, stop at slash
WORDCHARS='*?_-[]~\!#$%^(){}<>|`@#$%^*()+:?'

# home and end
bindkey  "^[[H"   beginning-of-line
bindkey  "^[[F"   end-of-line
# delete key
bindkey "^[[3~" delete-char

# idk lol
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word
bindkey "\C-h" backward-kill-word
bindkey "\e[3;5~" kill-word

export EDITOR=nvim
export VISUAL=${EDITOR}

mkcd () {
  mkdir $1 && cd "$_"
}

alias g="git"
GIT_LOCATION="$(which git)"
git () {
  if [[ $# -gt 0 ]]; then
    ${GIT_LOCATION} "$@"
  else
    forgit
    echo
    echo
    ${GIT_LOCATION} status
  fi
}
alias vim="nvim"
alias vi="nvim"
alias v="nvim"
alias n='nvim'
alias sudo='sudo -v; sudo '
alias s='sudo'
alias d='docker'
alias dc='docker-compose'
alias bm='bat --language help --plain'
alias t="trash"
alias update-grub='grub-mkconfig -o /boot/grub/grub.cfg'
alias copy="tee /dev/tty | tr -d '\n' | xclip -sel clip"
alias :q="exit"
alias ...="../.."
alias ....="../../.."
alias .....="../../../.."
alias ......="../../../../.."
alias .......="../../../../../.."
alias ls='exa --classify --group-directories-first'
alias l='exa --long --icons --all --header --extended --git --group-directories-first --classify'
alias cat="bat --plain --plain"
alias bat="bat --number"
globalias() {
  EXPAND_ALIASES=(g n v vi vim d dc s t)
   if [[ ${EXPAND_ALIASES[(ie)$LBUFFER]} -le ${#EXPAND_ALIASES} ]]; then
     zle _expand_alias
     zle expand-word
   fi
   zle self-insert
}
zle -N globalias
bindkey " " globalias

export MANPAGER="sh -c 'col -bx | bat -l man -p'"

# cd when typing directory
setopt autocd

fzf-up-arrow-widget() {
    local extra_ctrl_r="--layout=default --preview 'bat --color=always --plain --plain --language zsh <<<{}' --preview-window down:3:wrap"

    local selected num
    setopt localoptions noglobsubst noposixbuiltins pipefail no_aliases 2> /dev/null
    selected=( $(fc -rl 1 | perl -ne 'print if !$seen{(/^\s*[0-9]+\**\s+(.*)/, $1)}++' |
      FZF_DEFAULT_OPTS="--height ${FZF_TMUX_HEIGHT:-40%} $FZF_DEFAULT_OPTS -n2..,.. --tiebreak=index --header='tab to edit, enter to execute' --bind=ctrl-r:toggle-sort,ctrl-z:ignore --expect=tab $extra_ctrl_r --query=${(qqq)LBUFFER} +m" $(__fzfcmd)) )
    local ret=$?
    if [ -n "$selected" ]; then
      local select=0
      if [[ $selected[1] == tab ]]; then
        select=1
        shift selected
      fi
      num=$selected[1]
      if [ -n "$num" ]; then
        zle vi-fetch-history -n $num
        [[ $select == 0 ]] && zle accept-line
      fi
    fi
    zle reset-prompt
    return $ret
}
zle -N fzf-up-arrow-widget fzf-up-arrow-widget
bindkey "${terminfo[kcuu1]}" fzf-up-arrow-widget
bindkey "^[[A" fzf-up-arrow-widget
bindkey '^R' fzf-up-arrow-widget
# bindkey "${key[Up]}" fzf-up-arrow-widget

# opensuse
[[ -f /etc/zsh_command_not_found ]] && source /etc/zsh_command_not_found
export BAT_PAGER='less --quit-if-one-screen --chop-long-lines --RAW-CONTROL-CHARS --LONG-PROMPT --ignore-case'
export PAGER='less --quit-if-one-screen --chop-long-lines --RAW-CONTROL-CHARS --LONG-PROMPT --ignore-case'
[[ -d ${HOME}/bin ]] && export PATH="${PATH}:${HOME}/bin"
[[ -d ${HOME}/.local/bin ]] && export PATH="${PATH}:${HOME}/.local/bin"
