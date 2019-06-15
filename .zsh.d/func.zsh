# ranger-cd
if command -v ranger >/dev/null; then
    ranger-cd() {
        tempfile="$(mktemp -t tmp.XXXXXX)"
        /usr/bin/ranger --choosedir="$tempfile" "${@:-$(pwd)}"
        test -f "$tempfile" &&
            if [ "$(cat -- "$tempfile")" != "$(echo -n `pwd`)" ]; then
                cd -- "$(cat "$tempfile")"
            fi
            rm -f -- "$tempfile"
    }
fi

if command -v bc >/dev/null; then
    # bc one-liners
    calc() {
        bc -l <<< "$@"
    }
fi

# mkcd function
mkcd() { mkdir -p "$@" && cd "$@"; }
