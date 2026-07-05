# [Chris Hough](https://github.com/chrishough) Configurations

Every engineer's workstation configuration (`dotfiles`) is highly variable and tailored to their desires, habits, and software stack. I love rebuilding and tinkering with my build by learning from and collaborating with others.  This setup is what I use to get the job done, however, don't just accept my words as gospel, find your own path when setting up your build.  

>I also think it is important to reason from first principles, rather than, by analogy. So the normal way we conduct our lives is we reason by analogy. We're doing this because it's like something else that was done or like what other people are doing. Iterations on a theme. It's kinda mentally easier to reason by analogy rather than from first principles. First principles is kinda a physics way of looking at the world and what that really means is you kinda boil things down to the most fundamental truths and say okay, what are we sure is true? or sure as possible is true? and then reason up from there. That takes a lot more mental energy. - Elon Musk Foundation 20

These guides are highly opinionated. If you have any questions please post an issue. I am open to pull requests. Finally, this guide is supposed to read from top to bottom. If you are following this advice, please read it like *following the yellow brick road*, and have fun.  

# My Engineering Life
> This is how I setup my engineering life. Follow at your own risk, and feel free to open an issue for any bugs you may find. Refer to older versions of these dotfiles for Intel chipsets, version 8+ only supports the Apple M-Series chipsets. Happy to help my friends! This Guide was written on OSX 26.5.2 "Tahoe".

0. [Prepare Apple Workstation](/docs/installation/001.md)



1. [Setup a New or Reformatting an Existing Apple Workstation](/docs/installation/001.md)
2. [Install Additional Business and Workflow Software](/docs/installation/002.md)
3. [Engineering Workstation Setup and Configuration](/docs/installation/003.md)
4. [Artificial Intelligence Preferences and Configurations](/docs/installation/004.md)

#### Setup Scripts Reference

This repository includes two idempotent setup scripts that can be run safely multiple times—they only make changes when necessary.

##### `lib/install.sh` - Homebrew Package Installation

Installs essential development tools via Homebrew. Run with:
```bash
sh "$HOME/.myconfigurations/lib/install.sh"
```

**Idempotency:** Checks `brew list` before each install. Skips packages already present, only installs missing ones.

| Category | Packages |
|----------|----------|
| Shell | zsh, zsh-completions, zsh-syntax-highlighting, zsh-autosuggestions, tmux, autojump, fzf, direnv |
| Languages | ruby, rbenv, node, nvm, yarn, python |
| Tools | heroku, git-lfs, htop, wget, cmake, pkg-config, libpq |

##### `lib/setup.rb` - Configuration Symlinks

Creates symlinks from expected system locations to versioned config files in this repository. Run with:
```bash
ruby "$HOME/.myconfigurations/lib/setup.rb"
```

**Idempotency:** The `SetupHelper` module checks each path before acting:
- Correct symlink exists → skips (no action)
- Wrong symlink exists → removes old, creates correct
- Regular file exists → prompts to approve/decline replacement
- Nothing exists → creates parent directories and symlink

**Managed Symlinks:**

| Category | Source (System Location) | Destination (Config Store) |
|----------|--------------------------|--------------------------|
| dotfiles | `~/.bash_profile` | `dotfiles/.bash_profile` |
| dotfiles | `~/.bashrc` | `dotfiles/.bashrc` |
| dotfiles | `~/.gemrc` | `dotfiles/.gemrc` |
| dotfiles | `~/.profile` | `dotfiles/.profile` |
| dotfiles | `~/.pryrc` | `dotfiles/.pryrc` |
| dotfiles | `~/.vimrc` | `dotfiles/.vimrc` |
| dotfiles | `~/.zprofile` | `dotfiles/.zprofile` |
| dotfiles | `~/.zshrc` | `dotfiles/.zshrc` |
| tmux | `~/.tmux.conf` | `applications/tmux/conf` |
| tmux | `applications/tmux/paths.json` | `~/.myconfigurations.private/tmux/paths.json` |
| claude | `~/.claude/settings.json` | `~/.myconfigurations.private/claude/global/settings.json` |
| claude | `~/.claude/CLAUDE.md` | `~/.myconfigurations.private/claude/brains/global/CLAUDE.md` |
| vscode | `~/Library/.../User/settings.json` | `applications/vscode/settings.json` |
| vscode | `~/Library/.../User/keybindings.json` | `applications/vscode/keybindings.json` |
| vscode | `~/Library/.../User/snippets/ruby.json` | `applications/vscode/snippets/ruby.json` |
