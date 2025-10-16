#!/bin/bash
# ~/.config/hypr/scripts/backup.sh
# Auto backup selected configs to GitHub (no wallpapers)

set -e  # Exit if any command fails

# Define the source config folders
CONFIG_FOLDERS=(kitty spicetify wal hypr waybar wofi)

# Ensure dotfiles repo exists
cd ~/dotfiles || exit

# Force correct SSH remote (in case it's still HTTPS)
git remote set-url origin git@github.com:danielhaggeman/dotfiles.git

# Copy the selected configs to the repo
mkdir -p .config
for folder in "${CONFIG_FOLDERS[@]}"; do
    cp -r ~/.config/"$folder" .config/ 2>/dev/null || true
done

# Copy .zshrc
cp ~/.zshrc . 2>/dev/null || true

# Ensure repo is up-to-date
git fetch origin main
git rebase origin/main || true

# Only commit if there are changes
if ! git diff-index --quiet HEAD --; then
    git add .
    git commit -m "Auto-backup: $(date '+%Y-%m-%d %H:%M:%S')"
    git push origin main
    echo "✅ Configs backup completed and pushed successfully."
else
    echo "🟡 No changes to commit."
fi

