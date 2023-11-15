#!/usr/bin/env bash

git pull

head -n55 ~/.config/nvim/init.lua | tail -n50 > ~/.config/nvim/setup_conf.lua
nvim --headless -u ~/.config/nvim/setup_conf.lua "+PackerInstall" "+sleep2" "+qall"
rm -f ~/.config/nvim/setup_conf.lua
