# My dotfiles 

I am uploading all of these and made it public so that I could actually use it on my work computer 


## how to setup 
# My Dotfiles

I am uploading all of these and made it public so that I can easily use it on my work computer.

---

## How to Set Up

On any machine we could do the following to setup: 

> alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
> git clone --bare git@github.com:Xylemeister/dotfiles.git $HOME/.dotfiles
> dotfiles config --local status.showUntrackedFiles no
> dotfiles checkout

This will bring all the files in the correct place under $HOME 

then we could just install nvim or tmux and have it setup 

## how to use 

now you can upload any important setup by just using 

> dotfiles "some git commands"

this will behave like git and make dotfiles repo track files or changes 
