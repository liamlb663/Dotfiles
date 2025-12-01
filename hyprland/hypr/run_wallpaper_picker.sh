#!/usr/bin/env bash
source ~/.config/hypr/BackgroundPicker/venv/bin/activate
exec python ~/.config/hypr/BackgroundPicker/wallpaper_picker.py --interval 5 --nice 15 ~/Documents/Photos/
