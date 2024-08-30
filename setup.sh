# system
sudo apt update -y
sudo apt full-upgrade -y

# bash
echo "source ~/rpi/.bashrc" > ~/.bashrc
source ~/.bashrc

# apps
sudo apt install vim -y

# git
NAME=$(git config --global user.name)
if [ $NAME != "Kayce Basques" ]; then
    read -p "Email: " EMAIL
    git config --global user.email $EMAIL
    git config --global user.name "Kayce Basques"
    git config --global core.editor "vim"
    if [ ! -f ~/.ssh/ed25519.pub ]; then
        ssh-keygen -t ed25519 -C $EMAIL
        eval "$(ssh-agent -s)"
        ssh-add ~/.ssh/id_ed25519
        cat ~/.ssh/id_ed25519.pub
        echo "add key to https://github.com/settings/ssh/new"
        git remote remove origin
        git remote add origin git@github.com:kaycebasques/rpi.git
    fi
fi

# pico
source pico.sh
