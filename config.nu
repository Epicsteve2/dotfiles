
let-env config = {
  show_banner: false # true or false to enable or disable the banner
}

source ~/.cache/starship/init.nu
# source ~/.zoxide.nu # doesn't work
alias v = nvim
alias n = nvim
alias g = git
alias :q = exit
alias l = lsd --almost-all --human-readable --classify --group-directories-first  --header --long --blocks permission,size,date,name
alias cat = bat 
alias bm = bat --language man --plain 
