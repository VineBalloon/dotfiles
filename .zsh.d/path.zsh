# PATH
export PATH="$PATH:$HOME/bin"
export PATH="$PATH:$GOROOT/bin"
export PATH="$PATH:$GOPATH/bin"
export PATH="$PATH:$HOME/.local/bin"
if command -v gem >/dev/null; then
	export PATH="$PATH:$HOME/.gem/ruby/2.6.0/bin"
fi
#export PATH="$PATH:$HOME/cs3231/tools/bin"
