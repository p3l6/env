if [[ $(uname -m) == 'arm64' ]]; then
  # Apple silicon
  eval "$(/opt/homebrew/bin/brew shellenv)"
else
  # Intel mac
  eval "$(/usr/local/bin/brew shellenv)"
fi
