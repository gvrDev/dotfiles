#!/bin/bash

dmenu=$(dmenu_path)
fpak=$(ls $HOME/.local/share/flatpak/exports/bin)

result=$(echo -e "${dmenu}\n${fpak}" | dmenu)
