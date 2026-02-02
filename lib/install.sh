#!/bin/zsh
# sh "$HOME/.myconfigurations/lib/install.sh"

# Function to install brew packages if they don't exist
install_brew_packages() {
    # Array of packages to install
    local packages=(
        "autojump"
        "direnv"
        "fzf"
        "heroku"
        "rbenv"
        "node"
        "nvm"
        "yarn"
        "python"
        "git-lfs"
        "ruby"
        "htop"
        "wget"
        "tmux"
        "zsh"
        "zsh-completions"
        "zsh-syntax-highlighting"
        "zsh-autosuggestions"
        "cmake"
        "pkg-config"
        "libpq"
        "gitleaks"
        "chezmoi"
        "gh"
        "terminal-notifier"
    )

    echo "Running brew update..."
    brew update

    # Loop through packages and install if not present
    for package in "${packages[@]}"; do
        if brew list --formula | grep -q "^${package}\$"; then
            echo "✓ ${package} is already installed"
        else
            echo "Installing ${package}..."
            brew install "${package}"
        fi
    done

    echo "Running brew update and doctor..."
    brew update
    brew doctor
}

# Run the installation function
install_brew_packages
