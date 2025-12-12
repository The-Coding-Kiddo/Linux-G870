#!/usr/bin/env bash
set -e

echo "🔧 Installing packages..."
sudo apt update
sudo apt install -y \
  zsh \
  git \
  curl \
  fzf \
  zoxide \
  fonts-jetbrains-mono

echo "🐚 Installing Oh My Zsh…"
if [ ! -d "$HOME/.oh-my-zsh" ]; then
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

ZSH_CUSTOM="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}"

echo "🔌 Installing Zsh plugins…"
git clone https://github.com/zsh-users/zsh-autosuggestions \
  "$ZSH_CUSTOM/plugins/zsh-autosuggestions" || true

git clone https://github.com/zsh-users/zsh-syntax-highlighting \
  "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting" || true

echo "🎨 Installing Powerlevel10k…"
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git \
  "$ZSH_CUSTOM/themes/powerlevel10k" || true

echo "📄 Copying config files…"
cp zsh/.zshrc "$HOME/.zshrc"
cp zsh/.p10k.zsh "$HOME/.p10k.zsh"

echo "✅ Done. Restart your terminal."
