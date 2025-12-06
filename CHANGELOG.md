# Changelog

All notable changes to this project will be documented in this file.

## [8.0.0] - 2025-12-05

### Added
- **DVY - Dynamic tmux layout manager**: Complete replacement for itermocil
  - JSON-based configuration (`applications/tmux/paths.json`) for defining tmux sessions
  - Dynamic session loading with `jq` parsing
  - Two layout types:
    - `apps`: 4-pane layout (wide left column, 2 top-right, 1 bottom-right)
    - `configurations`: 5-pane layout (left column + 4 stacked rows on right)
  - Per-pane custom commands support in paths.json
  - Commands: `dvy <session>`, `dvy --list`, `dvy --kill`, `dvy --help`
  - Friendly error messages ("No server running my friend!")
- **Claude Code integration**: Added CLAUDE.md configuration files for AI-assisted development
- **JetBrains IDE support**: Added JetBrains configuration
- **Templates directory**: Added project templates for Rails and other frameworks
- **System setup runners**: New scripts for remapping dotfiles and library configurations

### Changed
- **Shell module refactoring**: Complete refactor and cleanup of sourced shell functions
  - Modular system now loads: `ror`, `git`, `brew`, `python`, `pg`, `heroku`, `js`, `shell`, `divvy`
  - Removed itermocil module in favor of divvy
- **Directory structure reorganization**:
  - `aitooling/` - AI tool configurations (Claude, Cursor, prompts)
  - `applications/` - Application-specific configs (tmux, vscode, itermocil)
  - `dotfiles/` - Shell configurations and functions
- **Private settings**: All private settings moved outside repo to `~/.myconfigurations.private`
- **Documentation**: Moved to `docs/` directory for both markdown and images

### Removed
- **Windsurf IDE**: Removed in favor of other tooling
- **Default LLM setting**: Removed hardcoded LLM defaults
- **Legacy scripts**: Cleaned up unused scripts and components

### Security
- Added guards in Claude configuration files
- Private configuration isolation to prevent accidental commits

---

## [7.4.0] - 2024

### Added
- GitHub Actions branch protection triggers
- Updated action configurations

---

## [7.3.0] - 2024

### Changed
- Various configuration updates and refinements

---

## [7.2.0] - 2024

### Changed
- Feature updates and improvements

---

## [7.1.0] - 2024

### Added
- Apple M1 chip support
  - Ruby M1 adjustments
  - NVM configuration for M1
  - `.profile` adjustments for both M1 and non-M1 machines

### Changed
- Updated Ruby version for default install
- Adjusted JavaScript tools for version 7 build

---

## [7.0.0] - 2024

### Added
- LICENSE file
- Qt5 documentation
- Client setup configurations
- Additional itermocil variations
- `htop` installation
- `gcbd` for git flow

### Changed
- Major machine reformat and rebuild
- Updated itermocil settings
- Replaced RawGit with jsDelivr for assets
- Documentation adjustments

### Fixed
- NVM name in symlinks
- Various typos and spelling errors
- Force remove local branches with `-D`

---

## [6.x] - Previous Versions

### Overview
- Initial itermocil integration for terminal window management
- Atom editor configurations and themes
- Ruby/Rails development shortcuts and helpers
- Git workflow shortcuts
- Homebrew package management
- Alfred workflows for productivity
- Zsh configuration with oh-my-zsh

---

## [5.0.0] and Earlier

### Historical Features
- Sublime Text configurations (later replaced by Atom)
- Vim setup and configurations
- Jekyll shortcuts
- Various editor themes and customizations
- Pry debugging configurations
- Docker shortcuts
- Heroku deployment helpers
- PostgreSQL management shortcuts
- NVM (Node Version Manager) setup
- RBenv Ruby version management

---

## Version History Summary

| Version | Focus |
|---------|-------|
| 8.0.0 | tmux/dvy migration, AI tooling, shell refactoring |
| 7.x | M1 support, GitHub Actions, documentation |
| 6.x | Itermocil, terminal management |
| 5.x | Major restructuring |
| 4.x | Atom editor, modern tooling |
| 3.x | Documentation, Alfred workflows |
| 2.x | Initial configurations |
