#!/usr/bin/env bash

# Get the directory where the script is located
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# List of config files you want to create symlinks for
config_files=("bash_aliases" "bash_logout" "bashrc" "createlink.sh" "profile")

# Loop over each file in the list
for file in "${config_files[@]}"; do
  # Define the target path in the home directory
  target_path="$HOME/.$file"
  # Define the source path in the SCRIPT_DIR where the actual file is stored
  source_path="$SCRIPT_DIR/$file"

  # Check if the source file exists in SCRIPT_DIR
  if [ -e "$source_path" ]; then
    # Create the symbolic link in the home directory pointing to the file in SCRIPT_DIR
    ln -sf "$source_path" "$target_path"
    echo "Symlink created: $target_path -> $source_path"
  else
    echo "Source file $source_path does not exist in $SCRIPT_DIR, skipping..."
  fi
done
