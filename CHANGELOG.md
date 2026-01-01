# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

---

## [8.1.0] - 2026-01-01

### Removed

#### Cursor IDE Configuration
- Removed entire Cursor IDE configuration (`applications/cursor/`)
  - `extensions.txt` - Extension list
  - `keybindings.json` - Keyboard shortcuts
  - `settings.json` - Editor settings
  - `snippets/ruby.json` - Ruby code snippets
  - `readme.md` - Setup documentation
  - `workspaces/.keep` - Workspace placeholder
  - `plugins/` - IDE plugins:
    - `misogi.ruby-rubocop-0.8.5.vsix.zip`
    - `vscode-markdown-emoji.zip`
    - `vscode-theme-railscasts-plus.zip`

**Summary**: Removed Cursor IDE in favor of other tooling.

---

## [8.0.0] - 2026-01-01

### Added

#### DVY - Dynamic tmux Layout Manager
Complete replacement for the legacy itermocil terminal window manager using modern tmux:
- **JSON-based configuration** (`applications/tmux/paths.json`) for persistent session definitions
- **Dynamic session naming** with auto-suffixing (creates `session_2`, `session_3` if base exists)
- **Two layout types** with ASCII documentation:
  - `apps`: 4-pane layout (wide left column with 2x2 grid on right)
  - `configurations`: 5-pane layout (left column with 4 stacked right panes)
- **Per-pane custom commands** for auto-navigation to project directories
- **System clipboard integration** for macOS (`pbcopy`)
- **Commands**: `dvy <session>`, `dvy -a`, `dvy -d`, `dvy --list`, `dvy --kill`, `dvy --help`
- 13 preconfigured sessions for personal and client projects

#### Docker Development Environment
Complete containerized database tooling with shell module (`dotfiles/functions/collections/docker`):
- **Container management**: `dkrps`, `dkrstopall`, `dkrstartall`, `dkrrmall`
- **Interactive selection**: `dkrselstop` with fzf multi-select support
- **Template system**: `dkrup <service>`, `dkrdown <service>`
- **Compose shortcuts**: `dkrcu`, `dkrcd`, `dkrcps`, `dkrclogs`
- **Direct database access**: `pg175`, `pg169` for PostgreSQL connections
- **Pre-configured templates** (`applications/docker/templates/`):
  - PostgreSQL 17.5 (port 5433, health checks, named volumes)
  - PostgreSQL 16.9 (port 5433, health checks, named volumes)
  - Redis 7 Alpine (port 6379, health checks)
  - OpenSearch 1.3.15 (ports 9200/9600, single-node, 512MB heap)

#### Claude Code Integration
AI-assisted development configuration (`aitooling/claude/`):
- **Global development guidelines** (`CLAUDE.md`) - 200+ lines covering:
  - Senior Software Architect expertise patterns
  - Security-first approach with OWASP focus
  - Language-specific guidelines (Ruby/Rails, JavaScript/TypeScript, Python)
  - Database optimization (PostgreSQL, Redis)
  - Cloud platform expertise (Heroku, AWS)
- **Sandboxed settings** (`settings.json`) with credential protection:
  - Blocks reading `.env`, secrets, SSH keys, credentials
  - Prevents modification of sensitive files
- **Plugins enabled**: Frontend Design, Playwright
- **Project brain files** for framework-specific context
- **Security prompts** for CISO application analysis

#### Application Configurations
- **Alfred** (`applications/alfred/`): 5 productivity workflows + custom themes
- **Keyboard Maestro** (`applications/keyboardmaestro/`): RBR macro library (22.7KB)
- **iTerm2** (`applications/iterm2/`): RBR profile with Base16 color scheme
- **JetBrains** (`applications/jetbrains/`): Railscasts_RBR theme
- **Cursor IDE** (`applications/cursor/`): Full setup with keybindings, snippets, plugins, workspaces
- **VSCode** (`applications/vscode/`): Settings, keybindings, Ruby snippets, workspaces

#### tmux Configuration
- Mouse support enabled
- System clipboard integration (macOS pbcopy)
- Custom key bindings (Ctrl+K/Cmd+K for clear screen and scrollback)
- Copy mode with vi-mode yank to clipboard

#### Ruby 4.0.0 Support
- Updated to Ruby 4.0.0 (first major Ruby release since 3.x series)
- rbenv configured for Ruby 4.0.0 as default version
- Updated Gemfile dependencies for Ruby 4.0.0 compatibility

#### Documentation & Installation
Comprehensive 3-step setup process (`docs/installation/`):
- **01.md** - Core macOS Setup (69 steps): OS installation, Xcode, system preferences, iTerm2
- **02.md** - Business & Workflow Software (10 steps): Security, browsers, productivity tools
- **03.md** - Engineering Workstation (21 steps): Homebrew, Git, Ruby 4.0.0, Node.js, Docker

#### Project Templates
- Git templates (`templates/git/`) for Rails and other frameworks
- Quick project scaffolding support

### Changed

#### Shell Module System Refactoring
Complete modular architecture with 9 shell modules (`dotfiles/functions/collections/`):

**Ruby Module** (`ruby`):
- Rails shortcuts: `rs`, `rsp`, `rc`, `rt`, `rtc`
- Bundle commands: `rbe`, `rbi`, `rbu`
- Database: `rdbr` (reset with structure:load)
- Logging: `rtail [logname]`
- Environment: RUBY_DEP_GEM_SILENCE_WARNINGS=1

**Docker Module** (`docker`):
- Full container lifecycle management
- Template-based service orchestration
- Interactive container selection with fzf

**Git Module** (`git`):
- Branch management: `gcb`, `gcbd`, `gcbfb`, `gdb`, `gck`
- Commit operations: `gc`, `gcm`, `gcz`, `gpo`, `gp`
- Tag management: `gct`, `gdt`, `grt`, `gpurgetags`
- Utilities: `gs`, `gd`, `gl`, `glt`, `gstats`, `ggoback`

**Homebrew Module** (`brew`):
- `bu` - Full update/upgrade/doctor cycle
- `bsc`, `bsl` - Service management

**JavaScript Module** (`js`):
- NVM integration with auto `.nvmrc` detection
- Bash completion for nvm commands

**Heroku Module** (`heroku`):
- CLI shortcuts: `h`, `hl`, `hlog`, `hps`, `hrr`, `hrc`

**Shell Utilities** (`shell`):
- `reloadshell`, `getpwd`, `flush`, `disc`, `up`, `purgeDS`
- Color helper: `msg <message> [color]`

**Divvy Module** (`divvy`):
- DVY tmux layout manager integration

**Python Module** (`python`):
- PATH configuration for Homebrew Python

#### Directory Structure Reorganization
- `aitooling/` - AI tool configurations (Claude, Cursor, prompts)
- `applications/` - Application configs (tmux, vscode, cursor, alfred, docker, jetbrains, iterm2, keyboardmaestro)
- `dotfiles/` - Shell configurations and modular functions
- `assets/` - Fonts (Fira Code), colors (Base16), images
- `docs/` - Installation guides and documentation
- `templates/` - Project scaffolding templates
- `lib/` - Installation scripts and helpers

#### Apple Silicon Exclusive
- Version 8.0.0+ requires M-series chips only
- Intel Mac support discontinued
- Homebrew paths updated for `/opt/homebrew/`
- libpq installation fixes for Apple Silicon

#### Private Configuration Isolation
- All private settings moved to `~/.myconfigurations.private` (outside repo)
- Guards in Claude configuration files to prevent accidental commits

### Removed
- **Windsurf IDE** - Configuration removed in favor of Cursor
- **Default LLM settings** - Hardcoded LLM defaults removed
- **itermocil** - Replaced by DVY/tmux system
- **Legacy scripts** - Unused scripts and components cleaned up
- **Intel Mac support** - Apple Silicon only going forward

### Security
- Comprehensive sandboxing in Claude settings (blocks .env, secrets, SSH keys)
- Private configuration isolation to prevent accidental credential commits
- GitLeaks integration for secret scanning
- OWASP-focused development guidelines

---

## [7.4.0] - 2025-08-10

### Added
- `.nvmrc` - Node version pinned to v22.6.0
- RuboCop linter check script (`scripts/linters/rubocop-check.sh`)
- Multiple Cursor IDE workspace configurations:
  - AboutChrisHough, LinksAboutChrisHough, api, athena-cli
  - myconfigurations, rubocop-goldbelly, wanderrocket.com
- Cursor IDE plugins: ruby-rubocop, vscode-markdown-emoji, railscasts-plus theme
- VSCode Ruby snippets (18 lines)
- Claude AI settings for Cursor IDE

### Changed
- Updated symlinks.rb setup script with substantial refactoring
- Updated Cursor/VSCode/Windsurf IDE settings and keybindings
- Updated shell configuration (.zshrc adjustments)

**Summary**: Major IDE configuration update adding RuboCop linting, Slim template support, and comprehensive multi-project workspace setup.

---

## [7.3.0] - 2025-05-21

### Added
- Gemfile with test dependencies (factory_bot, faker, rspec, rubocop)
- Gemfile.lock with locked dependency versions

### Changed
- Ruby version updated from 3.3.0 to 3.4.3
- symlinks.rb updated with Gemfile support

**Summary**: Ruby development infrastructure update with dependency management and Ruby 3.4.3.

---

## [7.2.0] - 2025-05-20

### Added
- `.gitleaks.toml` - Comprehensive secret scanning configuration (3130 lines)
- `tmp/.keep` - Placeholder for tmp directory

### Changed
- GitHub Actions workflow `.github/workflows/git_leaks.yml` updated

### Removed
- `.trigger` file (CI/CD trigger file)

**Summary**: Security infrastructure with GitLeaks secret detection and GitHub Actions automation.

---

## [7.1.0] - 2025-05-20

### Added
- `.github/dependabot.yml` - Dependency update automation
- `.github/workflows/git_leaks.yml` - GitHub Actions for secret scanning
- `CODEOWNERS` - Git codeowners configuration
- **Cursor IDE** full setup (keybindings, settings, snippets, workspaces)
- **Windsurf IDE** full setup (keybindings, settings, snippets, plugins, workspaces)
- **VSCode** additions (keybindings, workspaces)
- **JetBrains IntelliJ IDEA** setup (Railscasts_RBR color scheme, settings)

### Changed
- Apple M1 chip support with profile adjustments
- Ruby M1 adjustments and NVM configuration
- Updated shell shortcuts for git and Ruby on Rails
- Updated JavaScript tools for version 7 build

**Summary**: Major IDE standardization (Cursor, Windsurf, VSCode, IntelliJ) with GitHub Actions automation and M1 Mac compatibility.

---

## [3.0.0 - 7.0.0] - 2016-10-07

> **Note**: Versions 3.0.0 through 7.0.0 were retroactively tagged to the same commit during a major repository restructuring. They represent milestones in the project's evolution rather than distinct code changes.

### Added
- Automated symlink setup script (`scripts/setup/dotfiles/symlinks.rb`)
- LICENSE file
- Qt5 documentation
- Client setup configurations
- itermocil terminal window management
- `htop` installation support
- `gcbd` git flow shortcut

### Changed
- Major transition from manual file management to symlink-based architecture
- Replaced RawGit CDN with jsDelivr for assets
- Updated itermocil configurations
- Documentation reorganization

### Fixed
- NVM name handling in symlinks
- Various typos and documentation errors
- Force remove local branches with `-D` flag

**Tags in this range**: 3.0.0, 3.1.0, 3.2.0, 4.0.0, 4.1.0, 4.2.0, 4.2.1, 4.3.0, 4.3.1, 4.3.2, 4.4.0, 4.4.1, 4.5.0, 5.0.0, 6.0.0, 6.0.1, 6.1.0, 6.2.0, 6.3.0, 7.0.0

---

## [2.x Series] - 2016-02 to 2016-08

> **Summary**: The 2.x series established the foundation of the dotfiles repository with shell shortcuts, editor configurations, and Ruby/Rails development tooling.

### 2.14.0 (2016-08-04)
- Final 2.x release consolidating all improvements
- Added .gitignore protection for private configuration
- Updated Atom package screenshots and documentation

### 2.13.0 (2016-01-23)
- Adjusted Ruby functions with gem opener for Atom editor
- Fixed git go back functionality
- Bundle exec integration with guard

### 2.12.0 (2016-01-10)
- Version management milestone

### 2.5.1 (2016-07-03)
- Ensured Spring stops in Ruby shortcuts
- Updated Atom package documentation

### 2.5.0 (2016-06-11)
- Added Tabify shell function
- Created Alfred v3 theme (fork-of-notepad.alfredappearance)
- Added Zsh upgrade shortcut
- Ruby shortcuts to open gems via Atom

### 2.4.0 (2016-05-05)
- Added rbenv update plugin support
- README documentation updates

### 2.3.0 (2016-05-03)
- Fixed Ruby shell function exports
- Silenced gem warnings
- Added .env exclusion to Rails .gitignore
- Adjusted Heroku alias configuration

### 2.2.0 (2016-03-14)
- Added Pry configuration (.pryrc) for Ruby debugging
- Fixed Atom Cmd+Q close functionality

### 2.1.0 (2016-02-29)
- Fixed git branch fetching
- Improved Ruby documentation helper
- Enhanced Rails .gitignore template
- Atom whitespace handling for Slim files

### 2.0.0 (2016-02-02)
- **Initial tagged release**
- Shell shortcuts foundation
- `clear` shell function
- Basic dotfiles structure

---

## Version History Summary

| Version | Release | Focus |
|---------|---------|-------|
| 8.1.0 | 2026-01-01 | Cursor IDE removal |
| 8.0.0 | 2026-01-01 | Ruby 4.0.0, tmux/DVY migration, Docker templates, AI tooling, shell modularization, Apple Silicon exclusive |
| 7.4.0 | 2025-08-10 | RuboCop linting, IDE workspaces, NVM pinning |
| 7.3.0 | 2025-05-21 | Ruby 3.4.3, Gemfile infrastructure |
| 7.2.0 | 2025-05-20 | GitLeaks security scanning |
| 7.1.0 | 2025-05-20 | Multi-IDE support, M1 compatibility, GitHub Actions |
| 3.0.0-7.0.0 | 2016-10-07 | Symlink architecture, itermocil, major restructuring |
| 2.x | 2016-02 to 2016-08 | Foundation: shell shortcuts, Atom editor, Ruby/Rails tooling |
