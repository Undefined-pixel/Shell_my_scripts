#!/bin/sh
set -xe
# need to work on script
# https://zackreed.me/posts/aerospace_and_sketchybar_setup_on_macos/

brew install --cask nikitabobko/tap/aerospace

brew tap FelixKratz/formulae
brew install borders

brew tap FelixKratz/formulae
brew install sketchybar

mkdir -p ~/.config/sketchybar/plugins
cp $(brew --prefix)/share/sketchybar/examples/sketchybarrc ~/.config/sketchybar/sketchybarrc
cp -r $(brew --prefix)/share/sketchybar/examples/plugins/ ~/.config/sketchybar/plugins/

brew services start sketchybar

brew install --cask font-hack-nerd-font
brew install --cask font-sketchybar-app-font
