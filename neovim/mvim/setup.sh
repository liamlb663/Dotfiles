#!/usr/bin/env bash

git clone --depth 1 https://github.com/wbthomason/packer.nvim ~/.local/share/mvim/site/pack/packer/start/packer.nvim


nvim --headless -u ~/.config/mvim/setup_conf.lua "+PackerInstall"
