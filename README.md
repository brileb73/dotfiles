# dotfiles

Repo for all my stupid dotfiles

## Installation Instructions

OS X:

1. Install Apple command line tools: `xcode-select --install`
1. Clone this repo: `git clone https://github.com/omnibrian/dotfiles.git`
1. Install `pip`: `curl https://bootstrap.pypa.io/get-pip.py | sudo python`
1. Install `ansible`: `sudo pip install ansible`
1. Run `ansible-playbook main.yml -i inventory -K` from the root of this repo
1. Manual steps:
    * System Preferences > Keyboard > Modifier Keys > Caps Lock -> Control
    * Top Bar Battery Status > Show Percentage

## Contents

Different things contained in this repo:

* i3cfgbuild files
* Xresources files
* dunstrc
* polybar files
* shell rc and associated files (bashrc/zshrc)
* vimrc
* sublime text user preferences file
* emacs

## i3cfgbuild

The i3cfgbuild files are the part config files used as input for i3cfgbuild from the pip package i3-config-builder.

## i3lock-blur

The i3lock screen used is just symlinked from [this repo](https://github.com/omnibrian/i3lock-blur) to /usr/local/bin/i3lock-blur

## oh-my-zsh

The .zshrc file in sh uses oh-my-zsh and will most likely cause errors if oh-my-zsh is not installed.

## vimrc

The included vimrc uses pathogen and will probably not work if pathogen is not installed. More information [here](vim/README.md).

## GTK Theme

Using flatplat theme, installed from yaourt as `flatplat-theme`.
