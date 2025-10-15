#!/bin/bash
# ~/.config/hypr/scripts/backup.sh
# Auto backup selected configs to GitHub

CONFIG_FOLDERS=(kitty spicetify wal hypr waybar wofi sddm)

cd ~/dotfiles || exit

mkdir -p .config
for folder in "${CONFIG_FOLDERS[@]}"; do
    cp -r ~/.config/"$folder" .config/ 2>/dev/null
done

cp ~/.zshrc . 2>/dev/null

if ! git diff-index --quiet HEAD --; then
    git add .
    git commit -m "Auto-backup: $(date '+%Y-%m-%d %H:%M:%S')"
    GIT_SSH_COMMAND="ssh -o StrictHostKeyChecking=no" git push origin main
fi

