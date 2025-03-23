# Created by Zap installer
[ -f "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh" ] && source "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh"
plug "zsh-users/zsh-autosuggestions"
plug "zsh-users/zsh-syntax-highlighting"
plug "zap-zsh/supercharge"
plug "zap-zsh/exa"
plug "zap-zsh/fzf"
plug "Aloxaf/fzf-tab"
plug "hlissner/zsh-autopair"

# enable starship prompt
export STARSHIP_CONFIG=~/.config/starship/starship.toml
eval "$(starship init zsh)"

# enable rtx
eval "$(mise activate)"

# aliases
alias v='nvim'
alias gg='lazygit'
