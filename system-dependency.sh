#!/bin/bash

# JetBrainsMono font installation
sudo apt install curl
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/JetBrains/JetBrainsMono/master/install_manual.sh)"

# install ripgrep for consult ripgrep
sudo apt update
sudo apt install ripgrep

