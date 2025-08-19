# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Overview

This is a personal configuration repository ("dotfiles") for setting up and maintaining macOS development environments. It contains shell configurations, development tools settings, Alfred workflows, and comprehensive setup guides for engineering workstations.

## Common Development Commands

### Shell Module Management
The shell configuration system uses a modular approach with shortcuts and helpers:

```bash
# Help commands for each module
githelp      # Git shortcuts and workflows
herokuhelp   # Heroku shortcuts and workflows  
keybasehelp  # Keybase shortcuts and workflows
rubyhelp     # Ruby/Rails commands (in ror file)
shellhelp    # Shell utilities
brewhelp     # Homebrew package management
dockerhelp   # Docker container management
jshelp       # JavaScript/Node.js tools
pghelp       # PostgreSQL database operations
pythonhelp   # Python environment management
```

### Core Git Shortcuts
```bash
gs           # git status
gcb <name>   # Create and push new branch
ggoback      # Reset all local changes
gsmi         # Update with submodules
gstats       # Show commit statistics
```

### Ruby/Rails Development
```bash
rs           # Rails server (with spring stop)
rc           # Rails console (with spring stop)  
rt           # Run RSpec tests (with spring stop)
rbi          # Bundle install
rbu          # Bundle update
rdbr         # Reset database (drop, create, structure:load)
rbenvset     # Set local Ruby version to global
```

## High-Level Architecture

### Directory Structure
```
.myconfigurations/
├── shell/                    # Shell configurations and shortcuts
│   ├── includes             # Main entry point for shell includes
│   ├── global-settings      # Machine and include settings
│   ├── global-helpers       # Global helper functions
│   ├── shortcuts/           # Module-specific shortcuts (git, ror, etc.)
│   └── shortcut-help/       # Help documentation for each module
├── aitooling/               # AI tool configurations
│   ├── claude/              # Claude-specific settings and CLAUDE.md
│   ├── cursor/              # Cursor IDE settings
│   └── prompts/             # AI prompt templates
├── graphics/                # Documentation graphics and assets
├── __TBD__guides/           # Step-by-step setup guides
├── __TBD__workstation/      # Legacy IDE and tool configurations
├── __TBD__templates/        # Project templates
└── __TBD__scripts/          # Utility scripts and linters
```

### Shell Module System
The shell configuration loads modules dynamically through `shell/includes`:
1. Sources private configuration from `~/.myconfigurations.private`
2. Loads global settings and helpers
3. Iterates through defined modules (git, brew, heroku, keybase, ror, python, docker, shell, js, pg)
4. For each module, sources both shortcuts and help files

### Key Configuration Files
- **shell/includes**: Main entry point that orchestrates module loading
- **shell/global-settings**: Environment variables and system-wide settings
- **shell/global-helpers**: Shared utility functions used across modules
- **aitooling/claude/CLAUDE.md**: Global development guidelines for Claude

### Module Pattern
Each shell module follows a consistent pattern:
- `shortcuts/<module>`: Defines aliases and functions
- `shortcut-help/<module>`: Provides help documentation
- Modules are self-contained and can be enabled/disabled via the `_myconfig_modules` array

### Private Configuration
Sensitive settings are stored in `~/.myconfigurations.private` (not tracked in git) and sourced at the beginning of the shell initialization process.

## Development Workflow

### Setting Up a New Machine
Follow the guides in sequence:
1. Core macOS setup (`__TBD__guides/step_one_core.md`)
2. Business software (`__TBD__guides/step_two_software.md`)  
3. Engineering tools (`__TBD__guides/step_three_engineering_core.md`)
4. Ruby environment (`__TBD__guides/step_four_ruby.md`)
5. JavaScript tools (`__TBD__guides/step_five_js.md`)
6. Database setup (`__TBD__guides/step_six_database.md`)
7. IDE configuration (`__TBD__guides/step_seven_ide.md`)
8. Additional software (`__TBD__guides/step_eight_additional_software.md`)

### Adding New Shell Shortcuts
1. Choose the appropriate module or create a new one
2. Add functions/aliases to `shell/shortcuts/<module>`
3. Document in `shell/shortcut-help/<module>`
4. If new module, add to `_myconfig_modules` array in `shell/includes`

## Important Notes

- Ruby version is set to 3.4.3 in the Gemfile
- Uses Zsh as the default shell with oh-my-zsh framework
- Alfred workflows are stored in `scripts/alfred/`
- Legacy configurations are prefixed with `__TBD__` indicating they may need updating
- The repository follows the author's opinionated setup - adapt as needed for your use case