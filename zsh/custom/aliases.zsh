# Shortcuts

alias reloadshell="source $HOME/.zshrc"
alias reloaddns="dscacheutil -flushcache && sudo killall -HUP mDNSResponder"
alias sshkey='cat ~/.ssh/id_rsa.pub | pbcopy && echo "Copied to clipboard."'
alias shrug="echo '¯\_(ツ)_/¯' | pbcopy"
alias c="clear"
alias showFiles='defaults write com.apple.finder AppleShowAllFiles YES; killall Finder /System/Library/CoreServices/Finder.app'
alias hideFiles='defaults write com.apple.finder AppleShowAllFiles NO; killall Finder /System/Library/CoreServices/Finder.app'
alias zsc='code ~/.dotfiles/dotfiles.code-workspace'

# Directories
alias dotfiles="cd $DOTFILES"
alias projects="cd $HOME/workspace/freelancing/projects"

# PHP
alias cfresh="rm -rf vendor/ && composer i"
alias usephp74='brew-php-switcher 7.4 -c=valet'
alias usephp73='brew-php-switcher 7.3 -c=valet'
alias usephp72='brew-php-switcher 7.2 -c=valet'

# JS
alias nfresh="rm -rf node_modules/ && nvm use && npm install"
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
alias updatebrews='brew update && brew upgrade && brew cu --all --cleanup --yes && brew cleanup -s && rm -rf "$(brew --cache)"'
alias updateglobalnpm='npm --global update'
alias updateglobalcomposer='composer global update'
alias updateall='updatemacos ; updatemacapps ; updatebrews ; updateglobalnpm ; updateglobalcomposer'