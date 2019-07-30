# bare git repo config
alias config='/usr/bin/git --git-dir=${HOME}/.dotfiles/ --work-tree=${HOME}'

# ranger
if command -v ranger >/dev/null; then
    alias ra="ranger"
    alias ranger="ranger-cd"
fi

INTERFACE=$(ip link | grep -o "w.*:" | cut -d: -f1)
# NetworkManager
if command -v nmcli >/dev/null; then
    alias wifid="nmcli radio wifi off"
    alias wifie="nmcli radio wifi on"
    alias wifir="wifid && wifie"
# wpa_supplicant only
elif command -v wpa_supplicant >/dev/null; then
    WSCONF=/etc/wpa_supplicant/wpa_supplicant-$INTERFACE.conf
    alias wifid="sudo killall wpa_supplicant"
    alias wifie="sudo wpa_supplicant -i $INTERFACE -B -c $WSCONF"
    alias wifir="wifid && wifie"
fi

alias ctty="${HOME}/.ctty.sh"
alias dac="${HOME}/.dac.sh"

# lockgen
if command -v convert >/dev/null && command -v xdpyinfo >/dev/null; then
    alias lockgen="convert -scale $(xdpyinfo | grep -o "[[:digit:]]\+x[[:digit:]]\+ pixels" | cut -d' ' -f1) ~/pics/bg.png ~/pics/lock.png"
fi

# laptop power percentage alias
BAT="/sys/class/power_supply/BAT1"
if [ -d  $BAT ]; then
    alias cb="cat $BAT/capacity $BAT/status"
fi

# temp
alias temp="mkcd /tmp/$$"

# ctty
if [ -f ${HOME}/.ctty.sh ]; then
    alias ctty="${HOME}/.ctty.sh"
fi
