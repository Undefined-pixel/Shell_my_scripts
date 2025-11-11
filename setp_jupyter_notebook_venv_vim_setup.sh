#!/bin/sh

set -xe

function installpythonven() {
python3.10 -m venv my_venv
source my_venv/bin/activate
}

function intallpippacke() {
pip install "notebook<7" "jupyter_contrib_nbextensions"
jupyter contrib nbextension install --user
pip install numpy pandas matplotlib
}

function setupvimbindings() {
  # install jupyter-vim-binding only if not already installed
  local extdir
  extdir="$(jupyter --data-dir)/nbextensions/vim_binding"

  if [ -d "$extdir" ]; then
    echo "✅ vim_binding already installed at $extdir"
  else
    echo "📦 Installing jupyter-vim-binding..."
    mkdir -p "$(jupyter --data-dir)/nbextensions"
    cd "$(jupyter --data-dir)/nbextensions" || exit 1
    git clone https://github.com/lambdalisue/jupyter-vim-binding vim_binding
    jupyter nbextension enable vim_binding/vim_binding
    echo "✨ vim_binding installed and enabled!"
  fi
}

function main() {
  installpythonven
  intallpippacke
  setupvimbindings
  echo "you need to start the vnenv in python"
}

main
