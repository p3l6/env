#! /bin/bash

prompt_gate() {
  local exe="$1"
  read -r -p "[env/bootstrap] $exe was not found. Install it? [y/N] " answer
  case "$answer" in
    [yY]|[yY][eE][sS]) return 0 ;;
    *)
      echo "[env/bootstrap] ...skipping $exe"
      return 1
      ;;
  esac
}

is_install_needed() {
  local exe="$1"
  if command -v "$exe" >/dev/null 2>&1; then
    return 1
  fi
  prompt_gate $exe
  return $?
}

is_xcode_tools_needed() {
    if xcode-select -p >/dev/null 2>&1; then
        return 1
    fi
    prompt_gate "Xcode CLI tools"
    return $?
}

##########

# Install Xcode CLI
if is_xcode_tools_needed; then
  echo "[env/bootstrap] Installing Xcode CLI Tools"
  xcode-select --install
  read -r -p "[env/bootstrap] ...Press [enter] when complete" ignored
fi

#// :TODO:  if no WRKSP / DOTFILES / ~/var/env / etc
if [ ! -d $HOME/var/env ]; then
  prompt_gate "Dotfiles repository clone"
  if [ $? -eq 0 ]; then
    mkdir -p $HOME/var
    cd $HOME/var
    git clone "https://github.com/p3l6/env"
  fi
fi

# Install Homebrew
if is_install_needed "brew"; then
  echo "[env/bootstrap] Installing Homebrew"
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  eval "$(/opt/homebrew/bin/brew shellenv zsh)"
fi

# Install go-task
if is_install_needed "task"; then
  echo "[env/bootstrap] Installing Task"
  brew install go-task
fi

# Bootstrap is complete
echo "[env/bootstrap] Done. Next steps:"
echo "    > exit; # then open a new shell"
echo "    > task bundle"
