# My dotfiles 

These are my configuration files. I’m making them public so I can easily access them from my work computer.



## how to setup 

On a second computer, you can set up your dotfiles as follows:

```bash
> alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
> git clone --bare git@github.com:Xylemeister/dotfiles.git $HOME/.dotfiles
> dotfiles config --local status.showUntrackedFiles no
> dotfiles checkout
```


## how to use 

You can manage any important setup files using the `dotfiles` alias, just like regular Git commands:

```bash
> dotfiles "some git commands"
```

This will behave like Git and allow your dotfiles repository to track files and changes all the way from $HOME

## dependencies 
NVIM v0.11.3 (needs to be build from source if you use apt)
tmux 3.4
