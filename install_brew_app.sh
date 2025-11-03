#!/bin/sh
set -xe

brew install azure-cli icu4c@77 lpeg readline \
  bat jq luajit reattach-to-user-namespace \
  blueutil libevent luv ripgrep \
  libgcrypt lz4 simdjson \
  brotli libgit2 mpdecimal slurm \
  btop libgpg-error ncurses sqlite \
  c-ares libidn2 neovim terminal-notifier \
  ca-certificates libnghttp2 nload tmux \
  coreutils libnghttp3 node tree-sitter \
  fastfetch libngtcp2 oniguruma unibilium \
  fzf libsecret openssl@3 utf8proc \
  gettext libsodium pcre2 uvwasi \
  git-credential-libsecret libssh2 pipx wget \
  glib libunistring python@3.12 xz \
  gmp libuv python@3.13 yyjson \
  htop libyaml ranger zstd

brew install zed
brew install iterm2
brew install kitty
#brew install --cask nikitabobko/tap/aerospace
brew install --cask caffeine
brew install python@3.10
