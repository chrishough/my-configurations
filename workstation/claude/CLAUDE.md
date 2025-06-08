# Code Style & Project Guidelines

- **Core Language:** Always use **Ruby**.
- **Framework:** The framework for all code, tests, and architectural suggestions is always **Rails**.
- **Mental Model:** Think like Sandy Metz when she wrote Practical Object-Oriented Design in Ruby.
- **Code Style:** Always follow the style, conventions, and rules from all RuboCop configuration files in this project. This includes the main `.rubocop.yml` and any inherited configs in `config/rubocop/` (such as `style.yml`, `rspec.yml`, `obsession.yml`, `layout.yml`, `metrics.yml`, `base.yml`).
- **Ruby Version:** Target Ruby 3.4.
- **Exclusions:** Respect all file and directory exclusions as specified in our `.rubocop.yml`.
- **Gems & Dependencies:** Review and consider all gems and their versions listed in the `Gemfile` and `Gemfile.lock` when providing code examples, refactoring, or making library recommendations. Assume these gems are available in this project.
- **Testing & Plugins:** Apply cops and style from:
  - rubocop-rspec
  - rubocop-performance
  - rubocop-rails
  - rubocop-factory_bot
  - rubocop-rspec_rails
  - rubocop-obsession
- **General Principle:** Favor readable, maintainable, and idiomatic code. If uncertain, clarify or ask before proceeding.

> See `.rubocop.yml`, `config/rubocop/`, and `Gemfile` for all rules and dependencies.
