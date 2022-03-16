OS=$(uname)
if [ $OS = "FreeBSD" ]; then
    mngr=pkg
else
    echo "Unknown OS: $OS"
    exit 1
fi

$mngr install git

$mngr install zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
zsh -c "git clone --depth=1 https://github.com/romkatv/powerlevel10k.git \${ZSH_CUSTOM:-\$HOME/.oh-my-zsh/custom}/themes/powerlevel10k"
cp `pwd`/.zshrc ~/.zshrc
cp `pwd`/.p10k.zsh ~/.p10k.zsh

$mngr install autojump

$mngr install python310
python3.10 -m ensurepip
$mngr install npm

$mngr install neovim
mkdir ~/.config
ln -s `pwd`/nvim/nvim $HOME/.config/nvim
