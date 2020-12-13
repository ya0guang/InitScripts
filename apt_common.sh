# Environment
# Update System
sudo apt update && apt upgrade
sudo apt install vim curl wget zsh git fonts-powerline -y

# Oh My Zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
# download powerlevel10k
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
# chagne theme to powerlevel10k
sed -i 's#ZSH_THEME="robbyrussell"#ZSH_THEME="powerlevel10k/powerlevel10k"#g' ./.zshrc 

# VScode
sudo snap install --classic code

# Python Dev Env
sudo apt install python3-pip -y
