# system

sudo apt update -y
sudo apt full-upgrade -y

# apps

sudo apt install vim -y

# git

read -p "Email: " EMAIL
read -p "First name: " FIRST_NAME
read -p "Last name: " LAST_NAME

git config --global user.email $EMAIL
git config --global user.name "$FIRST_NAME $LAST_NAME"
git config --global core.editor "vim"

if [ ! -f ~/.ssh/ed25519.pub ]; then
    ssh-keygen -t ed25519 -C $EMAIL
    eval "$(ssh-agent -s)"
    ssh-add ~/.ssh/id_ed25519
fi
cat ~/.ssh/id_ed25519.pub
echo "add key to https://github.com/settings/ssh/new"

git remote remove origin
git remote add origin git@github.com:kaycebasques/rpi.git
