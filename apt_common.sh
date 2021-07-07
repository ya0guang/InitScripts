# Environment

# In case inside a container
apt update && apt install sudo

# Update System
sudo apt update && apt upgrade

# EDC
sudo apt install -y vim curl wget zsh git fonts-powerline

# Python3
sudo apt install -y python3 python3-dev python3-setuptools

# Compiliation toolchain
sudo apt install -y clang-10 llvm-10 build-essential cmake gcc

# Oh My Zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
# download powerlevel10k
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
# chagne theme to powerlevel10k
sed -i 's#ZSH_THEME="robbyrussell"#ZSH_THEME="powerlevel10k/powerlevel10k"#g' ./.zshrc 

# VScode
sudo snap install --classic code
