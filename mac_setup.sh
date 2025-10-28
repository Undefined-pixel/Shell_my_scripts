#!/bin/sh


removeAnimations() {
    printf "%b\n" "${YELLOW}Reducing motion and animations on macOS...${RC}"

    # Reduce motion in Accessibility settings (most effective)
    printf "%b\n" "${CYAN}Setting reduce motion preference...${RC}"
    defaults write com.apple.universalaccess reduceMotion -bool true

    # Disable window animations
    printf "%b\n" "${CYAN}Disabling window animations...${RC}"
    defaults write NSGlobalDomain NSAutomaticWindowAnimationsEnabled -bool false

    # Speed up window resize animations
    printf "%b\n" "${CYAN}Speeding up window resize animations...${RC}"
    defaults write NSGlobalDomain NSWindowResizeTime -float 0.001

    # Disable smooth scrolling
    printf "%b\n" "${CYAN}Disabling smooth scrolling...${RC}"
    defaults write NSGlobalDomain NSScrollAnimationEnabled -bool false

    # Disable animation when opening and closing windows
    printf "%b\n" "${CYAN}Disabling window open/close animations...${RC}"
    defaults write NSGlobalDomain NSAutomaticWindowAnimationsEnabled -bool false

    # Disable animation when opening a Quick Look window
    printf "%b\n" "${CYAN}Disabling Quick Look animations...${RC}"
    defaults write -g QLPanelAnimationDuration -float 0

    # Disable animation when opening the Info window in Finder
    printf "%b\n" "${CYAN}Disabling Finder Info window animations...${RC}"
    defaults write com.apple.finder DisableAllAnimations -bool true

    # Speed up Mission Control animations
    printf "%b\n" "${CYAN}Speeding up Mission Control animations...${RC}"
    defaults write com.apple.dock expose-animation-duration -float 0.1
    defaults write com.apple.dock expose-group-apps -bool true

    # Speed up Launchpad animations
    printf "%b\n" "${CYAN}Speeding up Launchpad animations...${RC}"
    defaults write com.apple.dock springboard-show-duration -float 0.1
    defaults write com.apple.dock springboard-hide-duration -float 0.1

    # Disable dock hiding animation
    printf "%b\n" "${CYAN}Disabling dock hiding animations...${RC}"
    defaults write com.apple.dock autohide-time-modifier -float 0
    defaults write com.apple.dock autohide-delay -float 0

    # Disable zoom animation when focusing on text input fields
    printf "%b\n" "${CYAN}Disabling text field zoom animations...${RC}"
    defaults write NSGlobalDomain NSTextShowsControlCharacters -bool true

    printf "%b\n" "${GREEN}Motion and animations have been reduced.${RC}"
    killall Dock
    printf "%b\n" "${YELLOW}Dock Restarted.${RC}"
}
fixfinder () {
    printf "%b\n" "${YELLOW}Applying global theme settings for Finder...${RC}"

    # Set the default Finder view to list view
    printf "%b\n" "${CYAN}Setting default Finder view to list view...${RC}"
    defaults write com.apple.finder FXPreferredViewStyle -string "Nlsv"

    # Configure list view settings for all folders
    printf "%b\n" "${CYAN}Configuring list view settings for all folders...${RC}"
    # Set default list view settings for new folders
    defaults write com.apple.finder FK_StandardViewSettings -dict-add ListViewSettings '{ "columns" = ( { "ascending" = 1; "identifier" = "name"; "visible" = 1; "width" = 300; }, { "ascending" = 0; "identifier" = "dateModified"; "visible" = 1; "width" = 181; }, { "ascending" = 0; "identifier" = "size"; "visible" = 1; "width" = 97; } ); "iconSize" = 16; "showIconPreview" = 0; "sortColumn" = "name"; "textSize" = 12; "useRelativeDates" = 1; }'

    # Clear existing folder view settings to force use of default settings
    printf "%b\n" "${CYAN}Clearing existing folder view settings...${RC}"
    defaults delete com.apple.finder FXInfoPanesExpanded 2>/dev/null || true
    defaults delete com.apple.finder FXDesktopVolumePositions 2>/dev/null || true

    # Set list view for all view types
    printf "%b\n" "${CYAN}Setting list view for all folder types...${RC}"
    defaults write com.apple.finder FK_StandardViewSettings -dict-add ExtendedListViewSettings '{ "columns" = ( { "ascending" = 1; "identifier" = "name"; "visible" = 1; "width" = 300; }, { "ascending" = 0; "identifier" = "dateModified"; "visible" = 1; "width" = 181; }, { "ascending" = 0; "identifier" = "size"; "visible" = 1; "width" = 97; } ); "iconSize" = 16; "showIconPreview" = 0; "sortColumn" = "name"; "textSize" = 12; "useRelativeDates" = 1; }'

    # Show all filename extensions
    printf "%b\n" "${CYAN}Showing all filename extensions in Finder...${RC}"
    defaults write NSGlobalDomain AppleShowAllExtensions -bool true

    # Show status bar in Finder
    printf "%b\n" "${CYAN}Showing status bar in Finder...${RC}"
    defaults write com.apple.finder ShowStatusBar -bool true

    # Show path bar in Finder
    printf "%b\n" "${CYAN}Showing path bar in Finder...${RC}"
    defaults write com.apple.finder ShowPathbar -bool true

    defaults write com.apple.finder AppleShowAllFiles -boolean true;

     # Restart Finder to apply changes
    printf "%b\n" "${GREEN}Finder has been restarted and settings have been applied.${RC}"
    killall Finder
}

reset_finder (){
defaults delete com.apple.finder
killall Finder
}

removeAnimations
fixfinder
