CURRENT_DIR="$(cd "$(dirname "$0")" && pwd)"

if [[ $XXH_VERBOSE != '2' ]]; then
  # Suppress: awk: xxh-shell-zsh/build/libtinfo.so.5: no version information available (required by /lib/x86_64-linux-gnu/libreadline.so.7)
  alias awk='awk $@ 2> >(grep -v "no version information available")'
fi

setopt +o nomatch
for pluginrc_file in $CURRENT_DIR/../../../plugins/**/*-zsh-*/build/pluginrc.zsh; do
  if [[ -f $pluginrc_file ]]; then
    if [[ $XXH_VERBOSE == '1' ]]; then
      echo Load plugin $pluginrc_file
    fi

    source $pluginrc_file
  fi
done
setopt -o nomatch

if [[ -f compinit ]]; then
    compinit -d $XXH_HOME/.zcompdump-$ZSH_VERSION
fi

cd ~
