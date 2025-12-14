# ==============================================
# CONFIGURAÇÃO ZSH - FELIPE FONTENELE
# ==============================================

# --- Histórico de Comandos (Não perde nada) ---
HISTFILE="$HOME/.zsh_history"
HISTSIZE=10000
SAVEHIST=10000
setopt EXTENDED_HISTORY
setopt SHARE_HISTORY

# --- Carregar Plugins (Se não existirem, ignora erros) ---
source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh 2>/dev/null || true
source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null || true

# --- Iniciar o Starship (A mágica visual) ---
eval "$(starship init zsh)"

# --- Aliases (Atalhos Úteis) ---
alias ll='ls -la --color=auto'
alias update='sudo dnf update && sudo dnf upgrade -y'
alias install='sudo dnf install'
alias myip='curl ifconfig.me' 
alias cls='clear'
alias c='clear'

# --- Fastfetch no Início (Sua assinatura) ---
if [[ -o interactive ]]; then
    fastfetch --config ~/.config/fastfetch/config.jsonc
fi
