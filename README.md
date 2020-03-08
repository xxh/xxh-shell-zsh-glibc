[Xxh](https://github.com/xxh/xxh) entrypoint for [zsh-portable](https://github.com/xxh/zsh-portable). 

## Install
```
cd ~/.xxh/xxh/shells/
git clone https://github.com/xxh/xxh-shell-zsh
./xxh-shell-zsh/build.xsh
xxh myhost +s xxh-shell-zsh
```
To avoid adding `+s` every time use xxh config in `~/.xxh/.xxhc`:
```
hosts:
  ".*":                     # Regex for all hosts
    +s: xxh-shell-zsh
```

## Plugins

**zsh xxh plugin** is the set of zsh scripts which will be run when you'll use xxh. You can create xxh plugin with your lovely aliases, tools or color theme and xxh will bring them to your ssh sessions.

🔎 [Search xxh plugins on Github](https://github.com/search?q=xxh-plugin-zsh&type=Repositories) or [Bitbucket](https://bitbucket.org/repo/all?name=xxh-plugin-zsh) or 💡 [Create xxh plugin](https://github.com/xxh/xxh-plugin-zsh-ohmyzsh)

Pinned xxh zsh plugins: [ohmyzsh](https://github.com/xxh/xxh-plugin-zsh-ohmyzsh), [powerlevel10k](https://github.com/xxh/xxh-plugin-zsh-powerlevel10k)

## Related 
* [zsh-portable](https://github.com/xxh/zsh-portable)
* [zsh.org / Portable rootless ZSH](https://www.zsh.org/mla/workers/2019/msg00866.html)

## Thanks
* Bart Schaefer from Zsh Mailing List
