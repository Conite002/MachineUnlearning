#!/bin/bash

# Supprimer l'installation existante de pyenv (si nécessaire)
rm -rf ~/.pyenv

# Installer pyenv
curl https://pyenv.run | bash

# Configuration du shell pour utiliser pyenv
export PATH="$HOME/.pyenv/bin:$PATH"
eval "$(pyenv init --path)"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

# dépendances nécessaires
sudo apt update
sudo apt install -y make build-essential libssl-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev libncursesw5-dev xz-utils tk-dev libffi-dev liblzma-dev openssl git

# Python 3.7.7 avec pyenv
pyenv install 3.7.7

# environnement virtuel avec Python 3.7.7
pyenv virtualenv 3.7.7 ML_ENV

# Activation
pyenv activate ML_ENV

# Installation Jupyter dans l'environnement virtuel
pip install jupyter

# Ajout de l'environnement virtuel comme Kernel
pip install ipykernel
python -m ipykernel install --user --name=ML_ENV

# Désactivation l'environnement virtuel
pyenv deactivate

echo "Environnement virtuel ML_ENV créé et configuré avec succès."
