# bare git repo config
alias config='/usr/bin/git --git-dir=${HOME}/.dotfiles/ --work-tree=${HOME}'

# ranger
if command -v ranger >/dev/null; then
    alias ra="ranger"
    alias ranger="ranger-cd"
fi

# wpa_supplicant
if command -v wpa_supplicant >/dev/null; then
    WSCONF=/etc/wpa_supplicant/wpa_supplicant-wlp3s0.conf
    alias wifid="sudo killall wpa_supplicant"
    alias wifie="sudo wpa_supplicant -i wlp3s0 -B -c $WSCONF"
    alias wifir="wifid && wifie"
fi

alias ctty="${HOME}/.ctty.sh"
alias dac="${HOME}/.dac.sh"

# lockgen
if command -v convert >/dev/null && command -v xdpyinfo >/dev/null; then
    alias lockgen="convert -scale $(xdpyinfo | grep -o "[[:digit:]]\+x[[:digit:]]\+ pixels" | cut -d' ' -f1) ~/pics/bg.png ~/pics/lock.png"
fi

# temp
alias temp="mkcd /tmp/$$"
