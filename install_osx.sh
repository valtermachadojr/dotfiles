#!/usr/bin/env bash
source ./utils.sh

function install_osX(){
  echo '::: Init install_osX :::'

  install_homebrew
  echo 'Init Brew doctor...'
  brew doctor
  echo 'Init Brew update'
  brew update

  echo '::: Install packages for development :::'

  install_package_with "brew" wget
  install_package_with "brew" openssl
  xcode-select --install
  install_package_with "brew" libxml2
  install_package_with "brew" jq

   # GIT
  install_package_with "brew" git
  install_package_with "brew" git-fresh
  install_package_with "brew" tig
  git_config

  # GIT FLOW
  install_package_with "brew" git-flow
  install_package_with "brew" git-flow-avh

  # iTERM
  install_package_with "cask" iterm2

  # NODE
  echo 'Install node and tools'
  install_package_with "brew" node
  install_nvm
  install_package_with "brew" yarn

  # PYTHON
  echo 'Install python and tools...'
  install_python_package pip
  install_python_package setuptools
  install_python_package virtualenvwrapper
  install_python_package pyenv
  install_python_package autoenv

  # Browsers
  echo 'Install Google Chrome'
  install_package_with "cask" google-chrome

  echo 'Install Opera'
  install_package_with "cask" opera

  echo 'Install Firefox'
  install_package_with "cask" firefox

  # Oh My ZSH
  echo 'Install zsh'
  install_package_with "brew" zsh
  install_package_with "brew" zsh-completions
  install_ohmyzsh
  update_zshrc_config
  install_zsh_plugins
  install_package_with "cask" font-fira-code

  echo '::: Config development stack :::'
  install_package_with "brew" ack
  install_package_with "brew" the_silver_searcher
  install_package_with "brew" zsh-syntax-highlighting

  echo '::: Install another tools :::'

  install_package_with "brew" nginx
  install_package_with "cask" dropbox
  install_package_with "brew" unrar
  install_package_with "brew" cakebrew
  install_package_with "brew" editorconfig

  echo '::: Finish install_osX :::'

}

function install_homebrew(){
  echo "Install homebrew..."

  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

  echo "Homebrew installed"
}

function install_python_package(){
  echo "Install/update python package < $1 >..."
  sudo pip install -U $1
  echo "Python package installed"
}

function install_ohmyzsh(){
  cd ~
  curl -L https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh | sh
  chsh -s /usr/local/bin/zsh
  cd -
}

function git_ignore_global(){
  curl 'https://www.gitignore.io/api/macos,vim,code,python' --output ~/.gitignore_global
  git config --global core.excludesfile ~/.gitignore_global
}

function update_zshrc_config(){
  FOLDER=$(pwd)
  ln -sfn "$FOLDER/ohmyzsh/.zshrc" ~/.zshrc
}

function install_zsh_plugins(){
  ZSH_PLUGIN_FOLDER=${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins

  git clone https://github.com/zsh-users/zsh-autosuggestions $ZSH_PLUGIN_FOLDER/zsh-autosuggestions

  mkdir $ZSH_PLUGIN_FOLDER/yarn-autocompletions
  curl -SL https://github.com/g-plane/zsh-yarn-autocompletions/releases/download/v1.2.0/yarn-autocompletions_v1.2.0_macos.zip | tar -xf - -C $ZSH_PLUGIN_FOLDER/yarn-autocompletions

  git clone https://github.com/djui/alias-tips.git $ZSH_PLUGIN_FOLDER/alias-tips

  git clone https://github.com/TamCore/autoupdate-oh-my-zsh-plugins $ZSH_PLUGIN_FOLDER/autoupdate

  git clone https://github.com/ltj/gitgo.git $ZSH_PLUGIN_FOLDER/gitgo

  git clone https://github.com/lukechilds/zsh-nvm $ZSH_PLUGIN_FOLDER/zsh-nvm

}

function install_nvm(){
  wget -qO- https://raw.github.com/creationix/nvm/master/install.sh | sh
}

install_osX
