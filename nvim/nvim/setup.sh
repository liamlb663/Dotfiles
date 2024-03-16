#!/usr/bin/env bash

git clone --depth 1 https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim


head -n57 ~/.config/nvim/init.lua | tail -n52 > ~/.config/nvim/setup_conf.lua
nvim --headless -u ~/.config/nvim/setup_conf.lua "+PackerInstall"
rm -f ~/.config/nvim/setup_conf.lua
