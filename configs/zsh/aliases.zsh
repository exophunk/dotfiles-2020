# Shortcuts

alias reloadshell="source $HOME/.zshrc"
alias reloaddns="dscacheutil -flushcache && sudo killall -HUP mDNSResponder"
alias sshkey='cat ~/.ssh/id_rsa.pub | pbcopy && echo "Copied to clipboard."'
alias shrug="echo '¯\_(ツ)_/¯' | pbcopy"
alias c="clear"
alias showFiles='defaults write com.apple.finder AppleShowAllFiles YES; killall Finder /System/Library/CoreServices/Finder.app'
alias hideFiles='defaults write com.apple.finder AppleShowAllFiles NO; killall Finder /System/Library/CoreServices/Finder.app'



# Directories
alias dotfiles="cd $DOTFILES"
alias projects="cd $HOME/workspace/freelancing/projects"

# PHP
alias cfresh="rm -rf vendor/ composer.lock && composer i"
alias usephp74='valet stop && valet use php@7.4 && sudo brew services stop php@7.2 && sudo brew services stop php@7.3 && valet start'
alias usephp73='valet stop && valet use php@7.3 && sudo brew services stop php@7.2 && sudo brew services stop php && valet start'
alias usephp72='valet stop && valet use php@7.2 && sudo brew services stop php && sudo brew services stop php@7.3 && valet start'

# JS
alias nfresh="rm -rf node_modules/ package-lock.json && npm install"
alias nwatch="nvm use && npm run watch"
alias ndev="nvm use && npm run dev"

# GIT
alias puoa='git push origin --all && git push --tags'
alias pullboth='git checkout master && git pull && git checkout develop && git pull'
alias pullall='for dir in */; do cd $dir && git pull;  cd .. ; done'
alias devbranchall='for dir in */; do cd $dir && git checkout develop;  cd .. ; done'
alias masterbranchall='for dir in */; do cd $dir && git checkout master;  cd .. ; done'
alias pulleverything='devbranchall && pullall && masterbranchall && pullall && devbranchall'

# Tools
alias ycl="~/workspace/freelancing/tools/cli/y7k"
alias jpg2png='for i in *.jpg; do sips -s format png "${i}" --out "${i%jpg}png"; done'
alias png2jpg='for i in *.png; do sips -s format jpeg "${i}" --out "${i%png}jpg"; done'
alias copypath="pwd | tr -d '\n' | pbcopy"
alias copyfilelist='ls|pbcopy'

# Updating
alias updatemacos='softwareupdate -ia'
alias updatemacapps='mas upgrade'
alias updatebrews='brew update && brew upgrade && brew cu --all --cleanup --yes && brew doctor && brew cleanup -s && rm -rf "$(brew --cache)"'
alias updateglobalnpm='npm --global update'
alias updateglobalcomposer='composer global update'
alias updateall='updatemacos && updatemacapps && updatebrews && updateglobalnpm && updateglobalcomposer'