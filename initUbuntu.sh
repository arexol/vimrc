pkgs='vim curl'
VIM_OK=$(dpkg-query -W -f='${Status}' vim 2>/dev/null | grep -c  "ok installed")
CURL_OK=$(dpkg-query -W -f='${Status}' curl  2>/dev/null | grep -c  "ok installed")

if [ $VIM_OK  -eq 0 ]; then 
  echo "vim is not installed"
  sudo add-apt-repository ppa:jonathonf/vim
  sudo apt update
  sudo apt --force-yes --yes install vim 
fi

if [ $CURL_OK  -eq 0 ]; then 
  echo "curl is not installed"
  sudo apt --force-yes --yes install curl 
  curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi

if [ ! -L ~/.vimrc ]; then
  echo "Create vimrc symblink"
  ln -s ~/vimrc/.vimrc ~/.vimrc
fi

vim +'PlugInstall' +qa

if [ ! -d ~/.fzf ]; then
 git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
 ~/.fzf/install
fi
sudo apt install build-essential cmake
sudo apt-get install python-dev python3-dev clang libclang-dev

cd ~/.vim/plugged/YouCompleteMe
python3 install.py --clang-completer 
