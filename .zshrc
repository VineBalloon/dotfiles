if [[ $- != *i* ]]; then
    # shell is non-interactive
    return
fi

ZSH_DISABLE_COMPFIX=true
# load zgen
if ! [ -d $HOME/.zgen ]; then
    git clone https://github.com/tarjoilija/zgen.git "${HOME}/.zgen"
fi

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

# load user scripts
if [ -d $HOME/.zsh.d ]; then
    for file in $HOME/.zsh.d/*.zsh; do
        source $file
    done
fi

