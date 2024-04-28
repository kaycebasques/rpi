read -p "Email: " EMAIL
read -p "First name: " FIRST_NAME
read -p "Last name: " LAST_NAME

git config --global user.email $EMAIL
git config --global user.name "$FIRST_NAME $LAST_NAME"
git config --global core.editor "vim"

if [ ! -d ~/.ssh ]; then
    echo "~/.ssh not found. creating now..."
    # ssh-keygen -t ed25519 -C $EMAIL
    # eval "$(ssh-agent -s)"
    # ssh-add ~/.ssh/id_ed25519
    # try ed25519-sk if ecdsa-sk doesn't work
    ssh-keygen -t ecdsa-sk -C $EMAIL
    eval "$(ssh-agent -s)"
    ssh-add ~/.ssh/id_ecdsa-sk
    cat ~/.ssh/id_ecdsa_sk.pub
    echo "add the key to https://github.com/settings/keys"
else
    echo "~/.ssh already exists. skipping keygen..."
fi
