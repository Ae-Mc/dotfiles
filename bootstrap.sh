OS=$(uname)
if [ $OS = "FreeBSD" ]; then
    mngr=pkg
else
    echo "Unknown OS: $OS"
    exit 1
fi

$mngr install git
ln -s `pwd`/.gitconfig $HOME/.gitconfig

$mngr install curl

$mngr install zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
zsh -c "git clone --depth=1 https://github.com/romkatv/powerlevel10k.git \${ZSH_CUSTOM:-\$HOME/.oh-my-zsh/custom}/themes/powerlevel10k"
rm ~/.zshrc
rm ~/.p10k.zsh
ln -s `pwd`/.zshrc $HOME/.zshrc
ln -s `pwd`/.p10k.zsh $HOME/.p10k.zsh

$mngr install autojump

$mngr install python310
python3.10 -m ensurepip
$mngr install npm

$mngr install neovim
mkdir ~/.config
ln -s `pwd`/nvim/nvim $HOME/.config/nvim
