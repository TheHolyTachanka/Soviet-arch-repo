# Soviet-arch-repo

Soviet-arch-repo is a arch repository for foss software(mainly mine)

## How to install Soviet-arch-repo

Just add the following lines to the end of /etc/pacman.conf:

```
[Soviet-arch-repo]
SigLevel = Optional DatabaseOptional
Server = https://theholytachanka.github.io/$repo/$arch
```

Then, sync the repo and update your system with:
```
sudo pacman -Syyu
```

And, then:
```
sudo pacman -S name-of-package
```

There is(for now) only one package in this repo i hope there will be more soon:
+ rufetch-git



