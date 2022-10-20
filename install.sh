#!/bin/bash
# Install all necessary things

# echo -n "Enter a number: "
# read VAR

# TODO:
# add gnu core utils for mac
# add brew for mac
# add neovim
# add git
# brew install coreutils findutils gnu-tar gnu-sed gawk gnutls gnu-indent gnu-getopt grep
# add rip
# add fd

install_brew(){
    echo "Installing Homebrew..."
    echo "See https://brew.sh/"
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
}

if [[ "$OSTYPE" == "darwin"* ]]
then
    if type brew &>/dev/null
    then
        echo "Brew is installed"
    else
        install_brew
    fi
else
  echo "Sorry, this system is not supported"
fi

