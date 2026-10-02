#! /bin/zsh

read "git_name?Local git_config user's name: "
read "git_email?Local git config user's email: "
mkdir -p dot/git/local
cat <<EOF > dot/git/local/gitconfig_local
[user]
  name = ${git_name}
  email = ${git_email}
EOF

# check origin and change to ssh
origin=$(git remote get-url origin 2>/dev/null)

if [[ $origin == https://* ]]; then
  git remote set-url origin 'git@github.com:p3l6/env.git'
fi

# if no keys, create ssh key and open github page for installing
keys=(~/.ssh/id*.pub(N))

if (( ${#keys} == 0 )); then
  ssh-keygen -t ed25519
  echo "Copying public key to clipboard"
  cat ~/.ssh/id_ed25519.pub | pbcopy
  open "https://github.com/settings/keys"
fi
