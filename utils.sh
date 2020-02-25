#!/bin/bash

function install_package_with() {
  printf "\n"
  if [[ $(check_installed $1 $2) == 0 ]]; then

    echo "< $2 > already installed"

  else

    if [[ $1 == "brew" ]]; then
        echo "Install < $2 > with brew..."
        brew install $2
        echo "< $2 > installed"

    elif [[ $1 == "cask" ]]; then
        echo "Install < $2 > with brew cask..."
        brew cask install $2
        echo "< $2 > installed"

    elif [[ $1 == "pip" ]]; then
        echo "Install/Update < $2 > with pip..."
        sudo pip install -U $2
        echo "< $2 > installed/updated"

    elif [[ $1 == "gem" ]]; then
        echo "Install < $2 > com gem..."
        sudo gem install $1
        echo "< $2 > installed"

    elif [[ $1 == "npm" ]]; then
        echo "Install < $2 > com npm..."
        sudo npm install -g $1
        echo "< $2 > installed"

    fi
  fi

  printf "\n"
}

function generate_ssh_key() {
    if [ ! -f "$HOME/.ssh/id_rsa" ]; then
        echo "Generating SSH key"
        ssh-keygen -t rsa -N "" -f "$HOME/.ssh/id_rsa" -C "$EMAIL"
        # Copy file content
        pbcopy < ~/.ssh/id_rsa.pub 
    fi
}

function git_config(){
  echo 'Set user and e-mail to configure Git'
  git config --global user.name "$NAME"
  git config --global user.email "$EMAIL"
  git config --global user.editor "$EDITOR"
  echo 'Git configured'
}

function check_installed(){
  if [ $1 == "apt" ] || [ $1 == "aptitude" ]; then
    if [[ $(dpkg-query -Wf'${db:Status-abbrev}' "$2") ]]; then
        echo 0
    else
        echo 1
    fi
  elif [ $1 == "brew" ]; then
    if [[ $(brew ls --versions $2 ) ]]; then
      echo 0;
    else
      echo 1;
    fi

  elif [ $1 == "cask" ]; then
    brew cask ls --versions $2

  fi
}