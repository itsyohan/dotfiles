#!/bin/sh

# Modified from original source:
# https://github.com/hoverinc/engineering/blob/main/script/bootstrap

# Exit script if any commands return errors (if they exit with non-zero)
set -e

default_rsa_path=~/.ssh/id_ed25519

# Ask the user where they want their RSA key stored
read -p "==> Where you would like your rsa_key stored [$default_rsa_path]: " rsa_path
rsa_path=${rsa_path:-$default_rsa_path}

# Check if RSA SSH keys already exist
if [[ -f "$rsa_path" ]]; then
  echo "==> Found SSH key in $rsa_path"
  echo
else
  # Setup Git/GitHub
  echo "==> What email address do you use with your GitHub account?"

  read github_email </dev/tty || {
    github_email=""
  }

  if [[ $github_email == "" ]]; then
    echo "==> ERROR! An email address is required."
    echo "==>        Re-run this script to try again."
    echo
    exit 1
  fi

  # https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent
  echo "==> Generating SSH key for $github_email …"
  ssh-keygen -t ed25519 -C "$github_email"
  echo

  echo "==> Starting ssh-agent in the background…"
  eval "$(ssh-agent -s)"
  echo

  # Ensure that SSH config file exists
  touch ~/.ssh/config

  # Add SSH key loading to SSH config
  echo "==> Adding SSH config to automatically load SSH keys"
  grep -qF -- "IdentityFile $rsa_path" ~/.ssh/config || echo "\n\nHost *\n AddKeysToAgent yes\n UseKeychain yes\n IdentityFile $rsa_path\n\n" >> ~/.ssh/config
  echo

  # Add SSH private key to the ssh-agent and store passphrase in your keychain
  echo "==> Adding SSH key to ssh-agent and storing passphrase in your keychain"
  ssh-add -K $rsa_path
  echo

  echo "==> Your browser will be opened to a GitHub SSH Keys settings page…"
  echo "==> You’ll need to paste into the 'Key' field, then click the 'Add SSK Key' button…"
  echo "==> Then, click 'Enable SSO' for that key."
  echo

  echo "==> Press any key to open your browser…"
  read

  echo "==> Opening your browser to a GitHub settings page…"
  open https://github.com/settings/ssh/new
  echo

  echo "==> Press any key to continue after you have saved your SSH key on GitHub and enabled SSO…"
  read
  echo
fi

echo "==> Copying your public SSH key to clipboard…"
pbcopy < $rsa_path
