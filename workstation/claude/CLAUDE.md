# Code Style Guidelines

When writing or refactoring Ruby code:

- Always follow the style and rules from all RuboCop configuration files in this project.
- This includes the main `.rubocop.yml` **and** any inherited configs from `config/rubocop/` (like `metrics.yml`, `style.yml`, `layout.yml`, `obsession.yml`, `rspec.yml`).
- Apply cops from these plugins:
  - rubocop-rspec
  - rubocop-performance
  - rubocop-rails
  - rubocop-factory_bot
  - rubocop-rspec_rails
  - rubocop-obsession
- Target Ruby version is **3.4**.
- Exclude files as specified in `.rubocop.yml`.
- When in doubt, prefer readable, maintainable, and idiomatic code, channeling the approach Sandy Metz used in *Practical Object-Oriented Design*.
