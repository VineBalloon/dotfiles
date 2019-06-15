if [[ $- != *i* ]]; then
    # shell is non-interactive
    return
fi

ZSH_DISABLE_COMPFIX=true
# load zgen
# run (git clone https://github.com/tarjoilija/zgen.git "${HOME}/.zgen") if you haven't
source "${HOME}/.zgen/zgen.zsh"

# if the init scipt doesn't exist
if ! zgen saved; then

    # specify plugins here
    zgen oh-my-zsh

    zgen oh-my-zsh plugins/git
    zgen oh-my-zsh plugins/sudo
    zgen oh-my-zsh plugins/command-not-found
    zgen oh-my-zsh plugins/colored-man-pages
    zgen oh-my-zsh plugins/vi-mode

    zgen load zsh-users/zsh-syntax-highlighting
    zgen load zsh-users/zsh-completions src
    zgen load zsh-users/zsh-autosuggestions

    zgen oh-my-zsh themes/ys

    # generate the init script from plugins above
    zgen save
fi

# thefuck
#eval $(thefuck --alias) 

# ranger-cd
ranger-cd() {
    tempfile="$(mktemp -t tmp.XXXXXX)"
    /usr/bin/ranger --choosedir="$tempfile" "${@:-$(pwd)}"
    test -f "$tempfile" &&
        if [ "$(cat -- "$tempfile")" != "$(echo -n `pwd`)" ]; then
            cd -- "$(cat "$tempfile")"
        fi
        rm -f -- "$tempfile"
}

# bc one-liners
calc() {
    bc -l <<< "$@"
}

# mkcd function
mkcd() { mkdir -p "$@" && cd "$@"; }

# exports
export GOROOT="/usr/lib/go"
export GOPATH="${HOME}/.gocode"

export VISUAL=vim
export EDITOR="$VISUAL"
#export SHELL=/bin/zsh

# ubuntu subsystem xming display export
#export DISPLAY=localhost:0.0

alias config='/usr/bin/git --git-dir=${HOME}/.dotfiles/ --work-tree=${HOME}'

# load other scripts

# aliases
alias ra="ranger"
alias ranger="ranger-cd"
WSCONF=/etc/wpa_supplicant/wpa_supplicant-wlp3s0.conf
alias wifid="pgrep wpa_supplicant | tail -n +2 | xargs sudo kill"
alias wifie="sudo wpa_supplicant -i wlp3s0 -B -c $WSCONF"
alias wifir="pgrep wpa_supplicant | tail -n +2 | xargs sudo kill && sudo wpa_supplicant -i wlp3s0 -B -c $WSCONF"
alias ctty="${HOME}/.ctty.sh"
alias dac="${HOME}/.dac.sh"

# PATH
export PATH="$PATH:$HOME/bin:$GOROOT/bin:$GOPATH/bin"
export PATH="$PATH:$HOME/.local/bin"
export PATH="$PATH:$HOME/cs3231/tools/bin"

# lockscreen
alias lockgen="convert -scale $(xdpyinfo | grep -o "[[:digit:]]\+x[[:digit:]]\+ pixels" | cut -d' ' -f1) ~/pics/bg.png ~/pics/lock.png"
