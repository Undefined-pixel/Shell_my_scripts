#!/bin/bash

echo "🧹 Starte vollständige Deinstallation von Visual Studio Code..."

# App entfernen
echo "🚮 Entferne VSCode App..."
sudo rm -rf "/Applications/Visual Studio Code.app"

# Benutzerbezogene Dateien entfernen
echo "🧼 Entferne Benutzerdateien..."
rm -rf ~/Library/Application\ Support/Code
rm -rf ~/Library/Caches/com.microsoft.VSCode
rm -rf ~/Library/Caches/com.microsoft.VSCode.ShipIt
rm -rf ~/Library/Preferences/com.microsoft.VSCode.plist
rm -rf ~/Library/Saved\ Application\ State/com.microsoft.VSCode.savedState
rm -rf ~/.vscode

# Optional: Insiders-Version entfernen
echo "📦 Prüfe auf VSCode Insiders..."
rm -rf ~/Library/Application\ Support/Code\ -\ Insiders
rm -rf ~/Library/Preferences/com.microsoft.VSCodeInsiders.plist

# Papierkorb leeren
echo "🗑 Leere Papierkorb..."
sudo rm -rf ~/.Trash/*

echo "✅ Visual Studio Code wurde vollständig entfernt."

