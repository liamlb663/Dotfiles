#!/usr/bin/env bash

# Get the directory where the script is located
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Define the target directory (local nvim directory) and the link destination
TARGET_DIR="$SCRIPT_DIR/alacritty"
LINK_DEST="$HOME/.config/alacritty"

# Remove any existing symbolic link or directory at ~/.config/nvim
if [ -e "$LINK_DEST" ]; then
    rm -rf "$LINK_DEST"
fi

# Create the symbolic link
ln -s "$TARGET_DIR" "$LINK_DEST"
echo "Symbolic link created: $LINK_DEST -> $TARGET_DIR"

