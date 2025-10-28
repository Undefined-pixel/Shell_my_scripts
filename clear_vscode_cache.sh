#!/bin/bash

echo "VS Code Cache Cleaner"

OS_TYPE="$(uname -s)"

case "$OS_TYPE" in
    Linux*)
        if grep -q Microsoft /proc/version &> /dev/null; then
            echo "→ Windows Subsystem for Linux (WSL) erkannt"
            winpath=$(wslpath "$APPDATA")
            cmd.exe /C "rd /s /q \"$winpath\\Code\\Cache\""
            cmd.exe /C "rd /s /q \"$winpath\\Code\\CachedData\""
            cmd.exe /C "rd /s /q \"$winpath\\Code\\Code Cache\""
            cmd.exe /C "rd /s /q \"$winpath\\Code\\User\\workspaceStorage\""
        else
            echo "→ Linux erkannt"
            rm -rf ~/.config/Code/Cache \
                   ~/.config/Code/CachedData \
                   ~/.config/Code/"Code Cache" \
                   ~/.config/Code/User/workspaceStorage
        fi
        ;;
    Darwin*)
        echo "→ macOS erkannt"
        rm -rf ~/Library/Application\ Support/Code/Cache \
               ~/Library/Application\ Support/Code/CachedData \
               ~/Library/Application\ Support/Code/"Code Cache" \
               ~/Library/Application\ Support/Code/User/workspaceStorage
        ;;
    CYGWIN*|MINGW*|MSYS*)
        echo "→ Windows (Git Bash o.ä.) erkannt"
        CACHE_DIR="$APPDATA\\Code"
        cmd.exe /C "rd /s /q \"$CACHE_DIR\\Cache\""
        cmd.exe /C "rd /s /q \"$CACHE_DIR\\CachedData\""
        cmd.exe /C "rd /s /q \"$CACHE_DIR\\Code Cache\""
        cmd.exe /C "rd /s /q \"$CACHE_DIR\\User\\workspaceStorage\""
        ;;
    *)
        echo "Unbekanntes Betriebssystem: $OS_TYPE"
        exit 1
        ;;
esac

echo "✔ VS Code Cache wurde bereinigt."
