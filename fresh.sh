#!/bin/sh

echo "Setting up your Mac..."

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

# Install PHP extensions with PECL
pecl install xdebug imagick

# Install global Composer packages
/usr/local/bin/composer global require laravel/valet

# Install Laravel Valet
$HOME/.composer/vendor/bin/valet install
valet tld valet
valet trust

cp configs/ext-xdebug.ini /usr/local/etc/php/7.4/conf.d/ext-xdebug.ini
cp configs/ext-xdebug.ini /usr/local/etc/php/7.3/conf.d/ext-xdebug.ini
cp configs/ext-xdebug.ini /usr/local/etc/php/7.2/conf.d/ext-xdebug.ini


# Install nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | bash
nvm install node
nvm install lts/erbium
nvm install lts/dubnium
nvm install lts/carbon
nvm use stable
npm -g install @vue/cli netlify-cli
nvm use lts/carbon
npm -g install gulp
nvm use stable

# Add npm packages to package.json when installing
npm config set save true

# Setup mysql
mysql_install_db
mysql.server start


# Removes .zshrc from $HOME (if it exists) and symlinks the .zshrc file from the .dotfiles
rm -rf $HOME/.zshrc
ln -s $HOME/.dotfiles/configs/.zshrc $HOME/.zshrc

# Symlink the Mackup config file to the home directory
ln -s $HOME/.dotfiles/configs/.mackup.cfg $HOME/.mackup.cfg

# Create coding dirs
mkdir $HOME/workspace
mkdir $HOME/workspace/personal
mkdir $HOME/workspace/freelancing
mkdir $HOME/workspace/freelancing/projects
mkdir $HOME/workspace/freelancing/prototypes
mkdir $HOME/workspace/freelancing/tools

# Clone Github repositories
./clone.sh

# Set macOS preferences
# We will run this last because this will reload the shell
source .macos

