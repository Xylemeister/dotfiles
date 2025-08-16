# My dotfiles 

These are my configs, I am making it public so I can access it from my work computer 



## how to setup 

On a second computer we could set up by the following

```bash
> alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
> git clone --bare git@github.com:Xylemeister/dotfiles.git $HOME/.dotfiles
> dotfiles config --local status.showUntrackedFiles no
> dotfiles checkout
```


## how to use 

now you can upload any important setup by just using 

```bash
> dotfiles "some git commands"
```

this will behave like git and make dotfiles repo track files or changes
