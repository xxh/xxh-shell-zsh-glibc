#CURRENT_DIR="$(cd "$(dirname "$0")" && pwd)"

for pluginrc_file in /home/yva/.xxh/xxh/plugins/**/*-zsh-*/pluginrc.zsh; do
  source $pluginrc_file
done