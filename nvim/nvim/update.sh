#!/usr/bin/env bash

git pull

head -n57 ~/.config/nvim/init.lua | tail -n52 > ~/.config/nvim/setup_conf.lua
nvim --headless -u ~/.config/nvim/setup_conf.lua "+PackerInstall"
rm -f ~/.config/nvim/setup_conf.lua
