alias ls='ls -G' # colors
alias l='ls -hAlF'
alias please='sudo'
alias pls='sudo'
alias p="ping -c 50 8.8.8.8"
alias clr="printf '\33c\e[3J'"
alias g="git status"
export CLICOLOR=1
export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx
#/usr/local/Cellar/openjdk/15.0.2
#echo 'export PATH="/usr/local/opt/openjdk/bin:$PATH"' >> ~/.zshrc
#export GIT_DIR=~/git

#/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/Users/sguo/git/edge-dev-tools/ci
#export PATH="$PATH:/Users/sguo/Library/Python/3.8/bin"
export JAVA_HOME=/Library/Java/JavaVirtualMachines/adoptopenjdk-8.jdk/Contents/Home/
# overwritten by sdkman
export PATH="$PATH:$HOME/git/edge-dev-tools/ci"
export PATH=/usr/local/bin:$PATH
export GRADLE_HOME=/usr/local/Cellar/gradle/7.0.2

export NVM_DIR="$HOME/.nvm"
  [ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && . "/usr/local/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

# ssh-add ~/.ssh/id_ed25519
eval "$(pyenv init -)"
#docker login docker-dev.artifactory.bluecatlabs.net
alias subl='/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl'
export EDITOR='/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl'


#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!	
export SDKMAN_DIR="/Users/sguo/.sdkman"
[[ -s "/Users/sguo/.sdkman/bin/sdkman-init.sh" ]] && source "/Users/sguo/.sdkman/bin/sdkman-init.sh"

parse_git_branch() {
	# echo -n " "
	# CURRENTBRANCH=`git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'`
	CURRENTBRANCH=`git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'`
	if ! [[ -z $CURRENTBRANCH ]]; then
		echo " ${CURRENTBRANCH}"
	fi
}

#location of bash5
#/usr/local/Cellar/bash/5.1.8/bin/bash 
# or better  /usr/local/bin/bash
#\033[0;31m
# PS1="\[\033[01;36m\]\u \[\033[01;33m\]\w\[\033[00m\]\[\033[35m\]\$(parse_git_branch)\[\033[00m\] \n\$ "
PS1="\[\033[01;36m\]\u \[\033[01;33m\]\w\[\033[00m\]\[\033[35m\]\$(parse_git_branch)\[\033[00m\] "