#! /bin/shell
mkdir -p ~/.local/share/fonts
cd ~/.local/share/fonts
curl -fLo "MesloLGS NF Regular.ttf" \
  https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/Meslo/L/Regular/MesloLGS%20NF%20Regular.ttf
curl -fLo "MesloLGS NF Bold.ttf" \
  https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/Meslo/L/Bold/MesloLGS%20NF%20Bold.ttf
curl -fLo "MesloLGS NF Italic.ttf" \
  https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/Meslo/L/Italic/MesloLGS%20NF%20Italic.ttf
curl -fLo "MesloLGS NF Bold Italic.ttf" \
  https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/Meslo/L/Bold-Italic/MesloLGS%20NF%20Bold%20Italic.ttf

# Schriftarten-Cache neu laden
fc-cache -fv

source ~/.zshrc
