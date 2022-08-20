#!/usr/bin/env zsh
## Added by Zinit's installer
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
        print -P "%F{33} %F{34}Installation successful.%f%b" || \
        print -P "%F{160} The clone has failed.%f%b"
fi

source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit
### End of Zinit's installer chunk

{ command -v starship &>/dev/null && eval $(starship init zsh) } || \
{
  zinit ice lucid atload'[[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh' nocd; zinit light romkatv/powerlevel10k
}

# based off of https://github.com/ohmyzsh/ohmyzsh/blob/master/lib/termsupport.zsh
zinit ice wait"0a" lucid; zinit light trystan2k/zsh-tab-title; ZSH_TAB_TITLE_ADDITIONAL_TERMS='alacritty|wezterm|xfce4-terminal'; ZSH_TAB_TITLE_DEFAULT_DISABLE_PREFIX="true"
# zinit light 'chrissicool/zsh-256color' # idk what this does lol
BASE16_THEME=monokai; zinit ice atload"base16_${BASE16_THEME}"; zinit light "chriskempson/base16-shell"
# zinit light ohmyzsh/ohmyzsh #Sucks on initial install
zinit light zsh-users/zsh-syntax-highlighting
zinit ice wait"0a" lucid atload'_zsh_autosuggest_start'; zinit light zsh-users/zsh-autosuggestions
# zinit ice depth=1 wait"1" lucid; zinit snippet OMZP::/zoxide
command -v zoxide &>/dev/null && { eval "$(zoxide init zsh)" && zstyle ':autocomplete:*' recent-dirs zoxide }
command -v thefuck &>/dev/null && { zinit ice wait"1" lucid; zinit snippet OMZ::plugins/thefuck }

# # Completions
# zinit ice wait"1" lucid atload"zicompinit; zicdreplay" blockf; zinit light zsh-users/zsh-completions
# zinit ice wait"1" lucid as"completion"; zinit snippet OMZP::docker-compose/_docker-compose
# zinit ice wait"1" lucid as"completion"; zinit snippet OMZP::docker/_docker
# zinit ice wait'1' lucid as"completion"; zinit snippet OMZP::terraform/_terraform
# zinit ice wait"1" lucid atload"zicompinit; zicdreplay" blockf; zinit snippet OMZP::aws
# zinit ice wait"1" lucid atload"zicompinit; zicdreplay" blockf; zinit snippet OMZP::kubectl
# zinit ice wait"1" lucid as"completion"; zinit snippet OMZP::pip/_pip
# zinit ice wait"1" lucid as"completion"; zinit snippet https://github.com/chmln/handlr/raw/master/completions/_handlr
# zinit ice wait"1" lucid as"completion"; zinit snippet https://github.com/alacritty/alacritty/releases/download/v0.9.0/_alacritty

zinit ice wait"1" lucid; zinit light wfxr/forgit
FORGIT_HELP=$(<<<'
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
FORGIT_FZF_DEFAULT_OPTS="--reverse --header '${FORGIT_HELP}' --height '100%'"
#https://git-scm.com/docs/git-log#Documentation/git-log.txt-emnem
# %C = color
# %h = short commit hash
# %an = author
# %d ref name (HEAD, origin)
# %s subject / commit message
# cr commit date, relative
FORGIT_LOG_FORMAT='%C(auto)%h %C(green)%an%C(auto)%d %C(reset)%s %C(magenta)%C(bold)%cr%Creset'
FORGIT_LOG_GRAPH_ENABLE=false

# Download a crap ton of programs
if false; then
  # EXA
  zinit ice wait"2" lucid from"gh-r" as"program" mv"bin/exa* -> exa" atload"alias ls='exa --classify --group-directories-first'; alias l='exa --long --icons --all --header --extended --git --group-directories-first --classify'"; zinit light ogham/exa
  zinit ice wait blockf atpull'zinit creinstall -q .'
  # DELTA
  zinit ice lucid wait"0" as"program" from"gh-r" pick"delta*/delta"; zinit light 'dandavison/delta'
  # DUST
  zinit ice wait"2" lucid from"gh-r" as"program" mv"dust*/dust -> dust" pick"dust" atload"alias du=dust"; zinit light bootandy/dust
  # # DUF Only works in debian...
  # zinit ice lucid wait"0" as"program" from"gh-r" bpick='*linux_amd64.deb' pick"usr/bin/duf" atload"alias df=duf"; zinit light muesli/duf
  # BAT
  zinit ice from"gh-r" as"program" mv"bat* -> bat" pick"bat/bat" atload"alias bat=bat"; zinit light sharkdp/bat
  # RIPGREP
  zinit ice from"gh-r" as"program" mv"ripgrep* -> ripgrep" pick"ripgrep/rg"; zinit light BurntSushi/ripgrep
  # # FD
  zinit ice as"command" from"gh-r" mv"fd* -> fd" pick"fd/fd"; zinit light sharkdp/fd
  # FZF
  zinit ice from"gh-r" as"command"; zinit light junegunn/fzf
  zinit ice lucid wait'0c' multisrc"shell/{completion,key-bindings}.zsh" id-as"junegunn/fzf_completions" pick"/dev/null"; zinit light junegunn/fzf
  # RANGER
  zinit ice depth'1' as"program" pick"ranger.py"; zinit light ranger/ranger
else
  command -v fzf &>/dev/null && {
    zinit snippet OMZP::fzf
    zinit ice wait"0c" lucid; zinit light Aloxaf/fzf-tab
  }
  [[ -f ~/.fzf.zsh ]] && source ~/.fzf.zsh
fi

# Source https://github.com/junegunn/fzf/issues/477#issuecomment-631707533 {{{
command -v fzf &>/dev/null && {
  fzf-up-arrow-widget() {
    local extra_ctrl_r="--preview 'bat --color=always --plain --plain --language zsh <<<{}' --preview-window down:3:wrap"

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
  # }}}
}

bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word
bindkey "\C-h" backward-kill-word
bindkey "\e[3;5~" kill-word

aptu() {
  sudo apt update

  tput setaf 1 && echo "Listing..." && tput sgr0
  apt list --upgradable

  tput setaf 1 && echo "Upgrading..." && tput sgr0
  sudo apt upgrade
}

dnf-search() {
  command fzf -e +s --multi --cycle --ansi \
    --bind='Ctrl-X:toggle-preview' \
    --no-hscroll --inline-info \
    --header='tab to select multiple packages, Ctrl-X for more info on a package' \
    --query="$*" \
    --preview='p={}; p="${p%% *}"; dnf -q info "${p%.*}"' \
    < <(dnf -qC repoquery --qf "$(tput setaf 2)%{name}$(tput sgr0) - %{summary}" \*) |
    awk '{ package=$1; sub(/\.\S+/, "", package); print package }' |
    xargs --open-tty --no-run-if-empty sudo dnf install
}

# just install fpf in AUR lol
# pacman-search() {
#   pacman -Ss '' \
#     | sort \
#     | cut --delimiter ' ' --fields 1 \
#     | fzf --multi --cycle --reverse --preview 'pacman -Ss {1}' \
#     | xargs --no-run-if-empty sudo pacman -S
# }


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

export LS_COLORS='no=0:rs=0:di=01;38;5;198:ln=01;38;5;37:mh=00:pi=48;5;230;38;5;136;01:so=48;5;230;38;5;136;01:do=48;5;230;38;5;136;01:bd=48;5;230;38;5;244;01:cd=48;5;230;38;5;244;01:or=48;5;235;38;5;160:su=48;5;160;38;5;230:sg=48;5;136;38;5;230:ca=30;41:tw=48;5;64;38;5;230:ow=48;5;235;38;5;33:st=48;5;33;38;5;230:*.tar=01;31:*.tgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.gz=01;31:ex=01;38;5;82:*.cmd=00;38;5;82:*.exe=00;38;5;82:*.com=00;38;5;82:*.btm=00;38;5;82:*.bat=00;38;5;82:*.jpg=00;38;5;37:*.jpeg=00;38;5;37:*.png=00;38;5;37:*.gif=00;38;5;37:*.bmp=00;38;5;37:*.xbm=00;38;5;37:*.xpm=00;38;5;37:*.tif=00;38;5;37:*.tiff=00;38;5;37:*.pdf=00;38;5;98:*.odf=00;38;5;98:*.doc=00;38;5;98:*.ppt=00;38;5;98:*.pptx=00;38;5;98:*.db=00;38;5;98:*.aac=00;38;5;208:*.au=00;38;5;208:*.flac=00;38;5;208:*.mid=00;38;5;208:*.midi=00;38;5;208:*.mka=00;38;5;208:*.mp3=00;38;5;208:*.mpc=00;38;5;208:*.ogg=00;38;5;208:*.ra=00;38;5;208:*.wav=00;38;5;208:*.m4a=00;38;5;208:*.axa=00;38;5;208:*.oga=00;38;5;208:*.spx=00;38;5;208:*.xspf=00;38;5;208:*.mov=01;38;5;208:*.mpg=01;38;5;208:*.mpeg=01;38;5;208:*.3gp=01;38;5;208:*.m2v=01;38;5;208:*.mkv=01;38;5;208:*.ogm=01;38;5;208:*.mp4=01;38;5;208:*.m4v=01;38;5;208:*.mp4v=01;38;5;208:*.vob=01;38;5;208:*.qt=01;38;5;208:*.nuv=01;38;5;208:*.wmv=01;38;5;208:*.asf=01;38;5;208:*.rm=01;38;5;208:*.rmvb=01;38;5;208:*.flc=01;38;5;208:*.avi=01;38;5;208:*.fli=01;38;5;208:*.flv=01;38;5;208:*.gl=01;38;5;208:*.m2ts=01;38;5;208:*.divx=01;38;5;208:*.log=00;38;5;240:*.bak=00;38;5;240:*.aux=00;38;5;240:*.bbl=00;38;5;240:*.blg=00;38;5;240:*~=00;38;5;240:*#=00;38;5;240:*.part=00;38;5;240:*.incomplete=00;38;5;240:*.swp=00;38;5;240:*.tmp=00;38;5;240:*.temp=00;38;5;240:*.o=00;38;5;240:*.pyc=00;38;5;240:*.class=00;38;5;240:*.cache=00;38;5;240:';
export EXA_COLORS="${LS_COLORS}"
export LSCOLORS=$LS_COLORS

zstyle ':completion:*:git-checkout:*' sort false
# set list-colors to enable filename colorizing
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
# set descriptions format to enable group support
zstyle ':completion:*:descriptions' format '[%d]'
# Case insensitive https://superuser.com/questions/1092033/how-can-i-make-zsh-tab-completion-fix-capitalization-errors-for-directories-and
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
# Makes kill autocomplete look good! ish. #TODO: i should change this
zstyle ':completion:*:*:*:*:processes' command ps -u stephen -o pid,user,comm -w -w
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#) ([0-9a-z-]#)*=01;34=0=01

# preview directory's content with exa when completing cd
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'exa -1 --color=always $realpath'
zstyle ':fzf-tab:complete:(-parameter-|-brace-parameter-|export|unset|expand):*' fzf-preview 'echo ${(P)word}'
zstyle ':fzf-tab:*' fzf-bindings 'tab:accept'
zstyle ':fzf-tab:*' continuous-trigger shift-tab
zstyle ':fzf-tab:*' accept-line enter
# Disabled cuz bug where last element won't be shown cuz of header
# zstyle ':fzf-tab:*' fzf-flags '--header="tab to continue completing, enter to execute, shift+tab to accept and edit, esc to cancel"'

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

forgit() {
    cat <<EOF | column -ts '|'
($(tput setaf 1)gl$(tput sgr0))|Interactive git log but better
($(tput setaf 1)ga$(tput sgr0))|Interactive git add selector
($(tput setaf 1)glo$(tput sgr0))|Interactive git log viewer
($(tput setaf 1)gi$(tput sgr0))|Interactive .gitignore generator
($(tput setaf 1)gd$(tput sgr0))|Interactive git diff viewer
($(tput setaf 1)grh$(tput sgr0))|Interactive git reset HEAD <file> selector
($(tput setaf 1)gcf$(tput sgr0))|Interactive git checkout <file> selector
($(tput setaf 1)gcb$(tput sgr0))|Interactive git checkout <branch> selector
($(tput setaf 1)gco$(tput sgr0))|Interactive git checkout <commit> selector
($(tput setaf 1)gss$(tput sgr0))|Interactive git stash viewer
($(tput setaf 1)gclean$(tput sgr0))|Interactive git clean selector
($(tput setaf 1)gcp$(tput sgr0))|Interactive git cherry-pick selector
($(tput setaf 1)grb$(tput sgr0))|Interactive git rebase -i selector
($(tput setaf 1)gfu$(tput sgr0))|Interactive git commit --fixup && git rebase -i --autosquash selector
EOF
}


# Based on http://stackoverflow.com/a/41420448/4757 {{{
# function expand-multiple-dots() {
#     local MATCH
#     if [[ $LBUFFER =~ '(^| )\.\.\.+' ]]; then
#         LBUFFER=$LBUFFER:fs%\.\.\.%../..%
#     fi
# }

# function expand-multiple-dots-then-expand-or-complete() {
#     zle expand-multiple-dots
#     zle expand-or-complete
# }

# function expand-multiple-dots-then-accept-line() {
#     zle expand-multiple-dots
#     zle accept-line
# }

# zle -N expand-multiple-dots
# zle -N expand-multiple-dots-then-expand-or-complete
# zle -N expand-multiple-dots-then-accept-line
# bindkey '^I' expand-multiple-dots-then-expand-or-complete
# bindkey '^M' expand-multiple-dots-then-accept-line
# This breaks autosuggest when running incorrect command
#}}}

# https://github.com/DanielFGray/fzf-scripts/blob/master/pkgsearch {{{
apt-search() {
  fzf -e +s --multi --cycle --ansi \
    --reverse \
    --bind='Ctrl-X:toggle-preview' \
    --no-hscroll --inline-info \
    --header='tab to select multiple packages, Ctrl-X for more info on a package' \
    --preview="apt-cache show {1} | sed --unbuffered --regexp-extended \"s|^([a-zA-Z0-9-]*?:)|$(tput setaf 1)\1$(tput sgr0)|\"" \
    --query="$1" \
    < <(apt-cache search '.*' | sort |
      sed -u -r "s|^([^ ]+)|$(tput setaf 2)\1$(tput sgr0)|") |
    cut -d' ' -f1 |
    xargs --no-run-if-empty --open-tty sudo apt install
}
# }}}

# https://github.com/DanielFGray/fzf-scripts/blob/master/igr {{{
superrg () {
    declare preview='bat --color=always --style=header,numbers -H {2} {1} | grep -C3 {q}'

    while getopts ':l' x; do
      case "$x" in
        l) list_files=1
          preview='bat --color=always --style=header,numbers {1} | grep -C3 {q}'
          ;;
      esac
    done
    shift $(( OPTIND - 1 ))
    unset x OPTARG OPTIND

    rg --color=always -n ${list_files:+-l} "$1" 2> /dev/null |
    fzf -d: \
    --ansi \
    --query="$1" \
    --phony \
    --bind="change:reload:rg -n ${list_files:+-l} --color=always {q}" \
    --bind="enter:execute:${EDITOR} {1}" \
    --preview="[[ -n {1} ]] && $preview"
}
#}}}

# Git specific filters from https://gist.github.com/junegunn/8b572b8d4b5eddd8b85e5f4d40f17236
# stole from https://github.com/parkercoates/dotfiles/blob/master/.zsh/fzf.zsh {{{
is_in_git_repo() {
  git rev-parse HEAD > /dev/null 2>&1
}
gt() {
  is_in_git_repo || return
  git tag --sort -version:refname |
  fzf-tmux --multi --preview-window right:70% \
    --preview 'git show --color=always {} | head -'$LINES
}
#}}}

# https://github.com/junegunn/fzf/wiki/Examples#man-pages
fman() {
    man -k . | fzf -q "$1" --prompt='man> '  --preview $'echo {} | tr -d \'()\' | awk \'{printf "%s ", $2} {print $1}\' | xargs -r man | col -bx | bat -l man -p --color always' | tr -d '()' | awk '{printf "%s ", $2} {print $1}' | xargs -r man
}

# Taken from https://gist.github.com/junegunn/f4fca918e937e6bf5bad {{{
alias glNoGraph='git log --color=always --format="%C(auto)%h %an %C(blue)%s %C(yellow)%cr"'
_gitLogLineToHash="echo {} | grep -o '[a-f0-9]\{7\}' | head -1"
_viewGitLogLine="$_gitLogLineToHash | xargs -I % sh -c 'git show --color=always % | delta'"
_viewGitLogLineUnfancy="$_gitLogLineToHash | xargs -I % sh -c 'git show %'"

# gl - git commit browser with previews and editor integration
gl() {
    glNoGraph |
        fzf --no-sort --reverse --tiebreak=index --no-multi \
            --ansi --preview="$_viewGitLogLine" \
                --header "enter to view, alt-y to copy hash, alt-v to open in ${EDITOR}" \
                --bind "enter:execute:$_viewGitLogLine   | less -R" \
                --bind "alt-v:execute:$_viewGitLogLineUnfancy | ${EDITOR} -" \
                --bind "alt-y:execute:$_gitLogLineToHash | xclip"
}
#}}}

# [[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh

# idk what this does lol, completions???
autoload bashcompinit && bashcompinit
autoload -Uz compinit && compinit

# cd when typing directory
setopt autocd

# when deleting word, stop at slash
WORDCHARS='*?_-[]~\!#$%^(){}<>|`@#$%^*()+:?'

[[ -d ${HOME}/bin ]] && export PATH="${PATH}:${HOME}/bin"

# home and end
bindkey  "^[[H"   beginning-of-line
bindkey  "^[[F"   end-of-line
# delete key
bindkey "^[[3~" delete-char

if command -v bat &>/dev/null; then
  # export MANROFFOPT='-c'
  export MANPAGER="sh -c 'col -bx | bat --language man --plain'"
  export BAT_PAGER='less --quit-if-one-screen --chop-long-lines --RAW-CONTROL-CHARS --LONG-PROMPT --ignore-case'
  alias cat="bat --plain --plain"
  alias fzfp="fzf --preview 'bat --color=always --plain --plain --line-range=:500 {}'"
fi

command -v nano &>/dev/null && export EDITOR=nano
command -v vim &>/dev/null && export EDITOR=vim
command -v micro &>/dev/null && export EDITOR=micro
command -v nvim &>/dev/null && export EDITOR=nvim
export VISUAL=${EDITOR}

export PAGER='less --quit-if-one-screen --chop-long-lines --RAW-CONTROL-CHARS --LONG-PROMPT --ignore-case'
export SHELL="$(which zsh)"

export HISTFILE="${HOME}/.zsh_history"
export HISTSIZE=100000
export SAVEHIST=$HISTSIZE

if command -v exa &>/dev/null; then
  alias ls='exa --classify --group-directories-first'
  alias l='exa --long --icons --all --header --extended --git --group-directories-first --classify'
else
  alias ls='ls --classify --group-directories-first --color=auto'
  alias l='\ls -hAlFv --group-directories-first --color=auto'
fi

alias bat="bat --number"
alias r="unalias rm && source ranger && alias rm='rm -v'"
alias lfc="lfcd"
alias ...="../.."
alias ....="../../.."
alias .....="../../../.."
alias ......="../../../../.."
alias .......="../../../../../.."
alias vim="nvim"
alias vi="nvim"
alias v="nvim"
alias n='nvim'
alias youtube-dl="yt-dlp"
alias yt-dl="yt-dlp"
alias open='handlr open'
alias cp="cp -v"
alias mv="mv -v"
alias mkdir="mkdir -pv"
alias rmdir="rmdir -pv"
alias rm="rm -v"
alias grep="grep --color=auto"
alias diff="diff --color=auto"
# so aliases work with sudo
alias sudo='sudo -v; sudo '
alias s='sudo'
alias d='docker'
alias dc='docker-compose'
alias bm='bat --language man --plain'
alias t='task'
alias update-grub='grub-mkconfig -o /boot/grub/grub.cfg'
alias copy="tee /dev/tty | tr -d '\n' | xclip -sel clip"

lfcd () {
    tmp="$(mktemp)"
    lf -last-dir-path="$tmp" "$@"
    if [ -f "$tmp" ]; then
        dir="$(cat "$tmp")"
        rm -f "$tmp"
        if [ -d "$dir" ]; then
            if [ "$dir" != "$(pwd)" ]; then
                cd "$dir"
            fi
        fi
    fi
}
# export FZF_CTRL_R_OPTS="--height=90% --preview 'bat --color=always -pp -l zsh <<<{}' --preview-window down:3:wrap"

# Expand only the g and k aliases
# source https://blog.patshead.com/2012/11/automatically-expaning-zsh-global-aliases---simplified.html
globalias() {
  EXPAND_ALIASES=(g k h n v vi vim d dc s t update-grub)
   if [[ ${EXPAND_ALIASES[(ie)$LBUFFER]} -le ${#EXPAND_ALIASES} ]]; then
     zle _expand_alias
     zle expand-word
   fi
   zle self-insert
}
zle -N globalias
bindkey " " globalias

if [[ -f /etc/zsh_command_not_found ]]; then
  source /etc/zsh_command_not_found
elif [[ -f /usr/etc/zsh_command_not_found ]]; then
  source /usr/etc/zsh_command_not_found
fi

mkcd () {
  mkdir $1 && cd "$_"
}

[[ -d ${HOME}/bin ]] && export PATH="${PATH}:${HOME}/bin"
[[ -d ${HOME}/.local/bin ]] && export PATH="${PATH}:${HOME}/.local/bin"
[[ -f /usr/share/doc/pkgfile/command-not-found.zsh ]] && source /usr/share/doc/pkgfile/command-not-found.zsh
