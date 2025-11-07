# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Load pywal colors
if [ -f "$HOME/.cache/wal/colors.sh" ]; then
    source "$HOME/.cache/wal/colors.sh"
fi

printf "\n"
#fastfetch
export ZSH="$HOME/.oh-my-zsh"
export PATH="$HOME/.spicetify:$PATH"
ZSH_THEME="agnosterzak"

plugins=(
    git
    archlinux
    zsh-autosuggestions
    zsh-syntax-highlighting
)

#source $ZSH/oh-my-zsh.sh

# Check archlinux plugin commands here
# https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/archlinux

# Display Pokemon-colorscripts
# Project page: https://gitlab.com/phoneybadger/pokemon-colorscripts#on-other-distros-and-macos
#pokemon-colorscripts --no-title -s -r #without fastfetch
#pokemon-colorscripts --no-title -s -r | fastfetch -c $HOME/.config/fastfetch/config-pokemon.jsonc --logo-type file-raw --logo-height 10 --logo-width 5 --logo -

# fastfetch. Will be disabled if above colorscript was chosen to install
# Set-up icons for files/directories in terminal using lsd

# Set-up FZF key bindings (CTRL R for fuzzy history finder)
source <(fzf --zsh)

HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory

# Simple zsh prompt: user @ host, current dir, with arrow
PROMPT='%n %~ %# '



export PATH=$PATH:/home/daniel/.spicetify
export PATH="$HOME/.spicetify-cli:$PATH"
export SDL_VIDEODRIVER=x11
export SDL_VIDEODRIVER=x11
# Fix arrow keys in Kitty
bindkey "^[[A" up-line-or-history
bindkey "^[[B" down-line-or-history
bindkey "^[[C" forward-char
bindkey "^[[D" backward-char
