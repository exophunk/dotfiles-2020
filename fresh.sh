#!/bin/sh

echo "Setting up your Mac..."

# Ask for the administrator password upfront
sudo -v

# Keep-alive: update existing `sudo` time stamp until We have finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Add SSH Key to keychain
ssh-add -K

# Install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"


# Check for Homebrew and install if we don't have it
if test ! $(which brew); then
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Update Homebrew recipes
brew update

# Install all our dependencies with bundle (See Brewfile)
brew tap homebrew/bundle
brew bundle
brew cleanup


# Removes .zshrc from $HOME (if it exists) and symlinks the .zshrc file from the .dotfiles
rm -rf $HOME/.zshrc
ln -s $HOME/.dotfiles/zsh/.zshrc $HOME/.zshrc
compaudit | xargs chmod g-w,o-w
source $HOME/.zshrc

# Install PHP extensions with PECL
mkdir -p /usr/local/lib/php/pecl # Fixes pecl xdebug install error
pecl install xdebug imagick

# Install global Composer packages
/usr/local/bin/composer global require laravel/valet

# Install Laravel Valet
$HOME/.composer/vendor/bin/valet install
valet tld valet
valet trust
valet use php@7.3

cp configs/ext-xdebug.ini /usr/local/etc/php/7.4/conf.d/ext-xdebug.ini
cp configs/ext-xdebug.ini /usr/local/etc/php/7.3/conf.d/ext-xdebug.ini
cp configs/ext-xdebug.ini /usr/local/etc/php/7.2/conf.d/ext-xdebug.ini


# Install nvm
nvm install node
nvm install lts/erbium
nvm install lts/dubnium
nvm install lts/carbon
nvm use stable
npm -g install @vue/cli netlify-cli alfred-packagist alfred-npms
nvm use lts/carbon
npm -g install gulp
nvm use stable

# Add npm packages to package.json when installing
npm config set save true

# Setup mysql
mysql_install_db
#mysql.server start
brew services start mariadb
sudo mysql -u root -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '';"


# Symlink the Mackup config file to the home directory
ln -s $HOME/.dotfiles/configs/.mackup.cfg $HOME/.mackup.cfg

# Copy gitignore global
rm -rf $HOME/.gitignore_global
ln -s $HOME/.dotfiles/configs/.gitignore_global $HOME/.gitignore_global

# Create coding dirs
mkdir $HOME/workspace
mkdir $HOME/workspace/personal
mkdir $HOME/workspace/freelancing
mkdir $HOME/workspace/freelancing/projects
mkdir $HOME/workspace/freelancing/prototypes
mkdir $HOME/workspace/freelancing/tools

# Clone Github repositories
./repositiories.sh

# Create project DB's
./databases.sh

# Set macOS preferences
# We will run this last because this will reload the shell
source .macos

