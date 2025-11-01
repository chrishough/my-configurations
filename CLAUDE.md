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
├── dotfiles/                # Shell configurations and dotfiles
│   ├── .zshrc              # Zsh configuration
│   ├── .bash_profile       # Bash profile
│   ├── functions/          # Shell functions and modules
│   │   ├── functions       # Main loader for shell modules
│   │   └── collections/    # Module-specific functions and help
│   │       ├── git         # Git shortcuts and help
│   │       ├── ror         # Ruby/Rails shortcuts and help
│   │       ├── brew        # Homebrew shortcuts and help
│   │       ├── heroku      # Heroku shortcuts and help
│   │       ├── shell       # Shell utilities and help
│   │       ├── js          # JavaScript/Node shortcuts
│   │       ├── pg          # PostgreSQL shortcuts
│   │       ├── python      # Python environment shortcuts
│   │       └── itermocil   # iTerm2 layouts
│   └── setup.rb            # Dotfiles setup script
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
The shell configuration loads modules dynamically through `dotfiles/functions/functions`:
1. Sources private configuration from `~/.myconfigurations.private`
2. Sets global environment variables (HISTSIZE, BROWSER, EDITOR)
3. Iterates through defined modules (itermocil, ror, git, brew, python, pg, heroku, js)
4. For each module, sources the combined functions and help from `collections/<module>`

### Key Configuration Files
- **dotfiles/functions/functions**: Main entry point that orchestrates module loading
- **dotfiles/.zshrc**: Zsh configuration with oh-my-zsh setup
- **dotfiles/functions/collections/**: Module-specific functions, aliases, and help text
- **aitooling/claude/CLAUDE.md**: Global development guidelines for Claude

### Module Pattern
Each shell module in `collections/` combines:
- Function definitions
- Aliases
- Help documentation (via `<module>help` function)
- Module-specific environment variables
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

## Security Guidelines

### Environment Variables and Secrets
- **NEVER read `.env` files** - they contain sensitive credentials, API keys, and secrets
- Use `.env.example` as reference for required environment variables
- For environment configuration questions, refer to `.env.example` only
- Private configuration is stored in `~/.myconfigurations.private` (not tracked in git)

## Important Notes

- Ruby version is set to 3.4.3 in the Gemfile
- Uses Zsh as the default shell with oh-my-zsh framework
- Alfred workflows are stored in `scripts/alfred/`
- Legacy configurations are prefixed with `__TBD__` indicating they may need updating
- The repository follows the author's opinionated setup - adapt as needed for your use case