#!/bin/zsh
# sh "$HOME/.myconfigurations/lib/install.sh"

# Function to install brew tap packages if they don't exist
install_brew_taps() {
    # Array of tap packages in "user/tap/formula" format
    local tap_packages=(
        "entireio/tap/entire"
        "PeonPing/tap/peon-ping"
    )

    echo "Installing tap packages..."
    for tap_package in "${tap_packages[@]}"; do
        local tap="${tap_package%/*}"
        local formula_name="${tap_package##*/}"

        if brew list --formula | grep -q "^${formula_name}\$"; then
            echo "✓ ${formula_name} is already installed"
        else
            echo "Tapping ${tap}..."
            brew tap "${tap}"
            echo "Installing ${tap_package}..."
            brew install "${tap_package}"
        fi
    done
}

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
        "watchman"
    )

    echo "Running brew update..."
    brew update

    echo "Loop through packages and install if not present..."
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

# Run the installation functions
install_brew_taps
install_brew_packages
