# Code Style & Project Guidelines

- **Core Language:** Always use **Ruby**.
- **Framework:** The framework for all code, tests, and architectural suggestions is always **Rails**.
- **Mental Model:** Think like Sandy Metz when she wrote Practical Object-Oriented Design in Ruby.
- **Code Style:** Whenever `.rubocop.yml` or any config files exist in `config/rubocop/` (such as `style.yml`, `rspec.yml`, `obsession.yml`, `layout.yml`, `metrics.yml`, `base.yml`), always read and apply their style, conventions, and rules in all code examples, code changes, and recommendations. If any of these files are not present, default to standard Ruby and Rails best practices.
- **Ruby Version:** Target Ruby 3.4.
- **Exclusions:** Respect all file and directory exclusions as specified in `.rubocop.yml`, if it exists.
- **Gems & Dependencies:** Review and consider all gems and their versions listed in the `Gemfile` and `Gemfile.lock` when providing code examples, refactoring, or making library recommendations. Assume these gems are available in this project.
- **Testing & Plugins:** Apply cops and style from the following plugins **if present**:
  - rubocop-rspec
  - rubocop-performance
  - rubocop-rails
  - rubocop-factory_bot
  - rubocop-rspec_rails
  - rubocop-obsession
- **General Principle:** Favor readable, maintainable, and idiomatic code. If uncertain, clarify or ask before proceeding.

> Always check for `.rubocop.yml`, any files in `config/rubocop/`, and the `Gemfile` in this project, and use them for all code and architectural suggestions. If any are missing, use standard Ruby/Rails practices as your guide.
