#!/bin/sh
set -e

# Variables
URL="https://github.com/ryanoasis/nerd-fonts/releases/download/v3.4.0/Hack.zip"
TMPDIR="$(mktemp -d)"
FONTDIR="$HOME/.local/share/fonts"

echo "Downloading Hack Nerd Font from $URL …"
curl -L -o "$TMPDIR/Hack.zip" "$URL"

echo "Unzipping …"
unzip -q "$TMPDIR/Hack.zip" -d "$TMPDIR/Hack-nerd"

echo "Installing fonts into $FONTDIR …"
mkdir -p "$FONTDIR"
find "$TMPDIR/Hack-nerd" -type f \( -iname "*.ttf" -o -iname "*.otf" \) -exec cp {} "$FONTDIR/" \;

echo "Updating font cache …"
fc-cache -f

echo "Cleaning up …"
rm -rf "$TMPDIR"

echo "Done. Restart applications to use the font."
