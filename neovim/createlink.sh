#!/usr/bin/env bash

# Get all subdirectories in the base directory
CONFIGS=$(find "." -mindepth 1 -maxdepth 1 -type d)

# Iterate through each configuration directory
for CONFIG_DIR in $CONFIGS; do
    CONFIG_NAME=$(basename "$CONFIG_DIR")         # Get the config name (e.g., 'nvim', 'mvim')
    ABS_PATH=$(realpath "$CONFIG_DIR")           # Get the absolute path of the config directory
    LINK_DEST="$HOME/.config/$CONFIG_NAME"       # Target link location (e.g., '~/.config/nvim')

    # Remove existing symbolic link or directory
    if [ -e "$LINK_DEST" ]; then
        rm -rf "$LINK_DEST"
    fi

    # Create symbolic link
    ln -s "$ABS_PATH" "$LINK_DEST"
    echo "Symbolic link created: $LINK_DEST -> $CONFIG_DIR"
done
