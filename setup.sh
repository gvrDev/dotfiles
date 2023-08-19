#!/bin/bash
echo "Creating symlinks..."
ln -sf ./nvim ~/.config/
ln -sf ./kitty ~/.config/
ln -sf ./picom ~/.config/
ln -sf ./zellij ~/.config/
ln -sf ./autostart ~/.config/gvr-autostart
ln -sf ./bin ~/.config/gvr-bin
ln -sf ./scripts ~/.config/gvr-scripts

echo "Cloning fonts"
mkdir -p ~/.local/share/fonts
mkdir temp-cache
cd temp-cache
git clone --filter=blob:none --sparse git@github.com:ryanoasis/nerd-fonts
cd nerd-fonts
git sparse-checkout add patched-fonts/JetBrainsMono

echo "Installing fonts"
./install.sh JetBrainsMono
cd ../..
rm -rf temp-cache
