# Environment
# Update System
sudo apt update && apt upgrade
sudo apt install vim curl wget zsh git -y

# Oh My Zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
# chagne theme to agnoster
sed -i 's#ZSH_THEME="robbyrussell"#ZSH_THEME="agnoster"#g' ./.zshrc 

# VScode
sudo snap install --classic code

# Python Dev Env
sudo apt install python3-pip -y
