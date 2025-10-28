#!/bin/sh
set -e

# Variables
URL="https://github.com/ryanoasis/nerd-fonts/releases/download/v3.4.0/Hack.zip"
TMPDIR="$(mktemp -d)"
FONTDIR="$HOME/Library/Fonts"

echo "Downloading Hack Nerd Font from $URL …"
curl -L -o "$TMPDIR/Hack.zip" "$URL"

echo "Unzipping …"
unzip -q "$TMPDIR/Hack.zip" -d "$TMPDIR/Hack-nerd"

echo "Installing fonts into $FONTDIR …"
mkdir -p "$FONTDIR"
find "$TMPDIR/Hack-nerd" -type f \( -iname "*.ttf" -o -iname "*.otf" \) -exec cp {} "$FONTDIR/" \;

echo "Cleaning up …"
rm -rf "$TMPDIR"

echo "Done. Please restart your applications or logout/login so the font is available."
