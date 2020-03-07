Xxh entrypoint for portable zsh shell. 

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

## Related 
* [zsh-portable](https://github.com/xxh/zsh-portable)
* [zsh.org / Portable rootless ZSH](https://www.zsh.org/mla/workers/2019/msg00866.html)
