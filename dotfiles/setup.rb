# frozen_string_literal: true

PATHS.push(
  {
    dotfiles: [
      {
        source: "$HOME/.bash_profile",
        destination: "$HOME/.myconfigurations/dotfiles/.bash_profile",
      },
      {
        source: "$HOME/.bashrc",
        destination: "$HOME/.myconfigurations/dotfiles/.bashrc",
      },
      {
        source: "$HOME/.gemrc",
        destination: "$HOME/.myconfigurations/dotfiles/.gemrc",
      },
      {
        source: "$HOME/.profile",
        destination: "$HOME/.myconfigurations/dotfiles/.profile",
      },
      {
        source: "$HOME/.pryrc",
        destination: "$HOME/.myconfigurations/dotfiles/.pryrc",
      },
      {
        source: "$HOME/.vimrc",
        destination: "$HOME/.myconfigurations/dotfiles/.vimrc",
      },
      {
        source: "$HOME/.zprofile",
        destination: "$HOME/.myconfigurations/dotfiles/.zprofile",
      },
      {
        source: "$HOME/.zshrc",
        destination: "$HOME/.myconfigurations/dotfiles/.zshrc",
      }
    ],
  },
)
