export PATH="/usr/sbin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$HOME/.elan/bin:$PATH"
export PATH="$HOME/.npm-global/bin:$PATH"
export PATH="$HOME/flutter/bin:$PATH"

export EDITOR="nvim"
export VISUAL="nvim"
export CHROME_EXECUTABLE="/usr/sbin/google-chrome-unstable"

HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt APPEND_HISTORY
setopt SHARE_HISTORY
setopt AUTO_CD
setopt HIST_FIND_NO_DUPS
setopt HIST_REDUCE_BLANKS
setopt HIST_IGNORE_SPACE

WORDCHARS=${WORDCHARS//\//}

bindkey "\e[1;5C" forward-word
bindkey "\e[1;5D" backward-word
bindkey '^[[A' history-search-backward
bindkey '^[[B' history-search-forward
bindkey ' ' magic-space

autoload -Uz compinit
if [[ ! -f ~/.zcompdump || $(find ~/.zcompdump -mtime +1 2>/dev/null) ]]; then
    compinit
    touch ~/.zcompdump
else
    compinit -C
fi

zstyle ':completion:*' menu select
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

if [ -f /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh ]; then
    source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
fi

if [ -f ~/.zsh/fzf-tab/fzf-tab.plugin.zsh ]; then
    source ~/.zsh/fzf-tab/fzf-tab.plugin.zsh
    zstyle ':fzf-tab:complete:cd:*' fzf-preview 'eza -1 --color=always $realpath'
    zstyle ':fzf-tab:complete:cat:*' fzf-preview 'bat --color=always --style=numbers --line-range=:500 $realpath'
fi

eval "$(starship init zsh)"
eval "$(zoxide init zsh)"
source <(fzf --zsh)
bindkey '^R' fzf-history-widget

if command -v atuin >/dev/null 2>&1; then
    eval "$(atuin init zsh --disable-up-arrow)"
fi

alias ls='eza --icons --group-directories-first'
alias ll='eza -alF --icons --group-directories-first --git'
alias la='eza -a --icons --group-directories-first'
alias lt='eza --tree --level=2 --icons'

alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -I'
alias bat='bat --paging=never'
alias grep='grep --color=auto'
alias mkdir='mkdir -p'
alias cd='z'
alias cdi='zi' 

alias pacsyu='sudo pacman -Syu'
alias pacs='sudo pacman -S'
alias pacr='sudo pacman -Rns'
alias pacq='pacman -Q | grep'
alias paco='sudo pacman -Qtdq | sudo pacman -Rns -'
alias yays='yay -S'
alias yayu='yay -Sua --noconfirm'
alias paclog='tail -n 50 /var/log/pacman.log'

alias nano="nvim"
alias nn="nvim"
alias vi="nvim"
alias vim="nvim"

alias myip="curl -s wtfismyip.com/json | jq -r 'to_entries | .[] | \"\(.key | sub(\"YourFucking\"; \"\")):\t\(.value)\"' | column -t -s $'\t'"

alias enable-store='adb shell cmd package install-existing com.android.vending && echo "Play Store enabled!"'
alias disable-store='adb shell pm uninstall -k --user 0 com.android.vending && echo "Play Store disabled!"'

alias reload='source ~/.zshrc && echo "Config reloaded."'
alias info="dashboard.py"

extract () {
  if [ -f "$1" ] ; then
    case "$1" in
      *.tar.bz2)   tar xjf "$1"     ;;
      *.tar.gz)    tar xzf "$1"     ;;
      *.bz2)       bunzip2 "$1"     ;;
      *.rar)       unrar e "$1"     ;;
      *.gz)        gunzip "$1"      ;;
      *.tar)       tar xf "$1"      ;;
      *.tbz2)      tar xjf "$1"     ;;
      *.tgz)       tar xzf "$1"     ;;
      *.zip)       unzip "$1"       ;;
      *.Z)         uncompress "$1"  ;;
      *.7z)        7z x "$1"        ;;
      *)           echo "'$1' cannot be extracted via extract()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

function pdf() {
    local file=$(fd -e pdf . ~/ | fzf --prompt="Search PDF: " --layout=reverse)
    if [ -n "$file" ]; then
        (zathura "$file" >/dev/null 2>&1 &)
        kill -9 $PPID
    fi
}

zmd() {
    if [ -z "$1" ]; then
        echo "Usage: zmd <file_report.md>"
        return 1
    fi
    local md_file="$1"
    local pdf_file="/tmp/$(basename "${md_file%.*}").pdf"

    echo "Generating PDF..."
    
    pandoc "$md_file" -o "$pdf_file" --pdf-engine=xelatex
    
    if [ $? -eq 0 ]; then
        zathura "$pdf_file" >/dev/null 2>&1 &
        disown
    else
        echo "Error: PDF conversion failed."
        echo "Make sure pandoc and latex packages are installed."
    fi
}

if command -v fastfetch &> /dev/null; then
    fastfetch
fi

if [ -f /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]; then
    source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi
