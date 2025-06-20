# Code Style & Project Guidelines

- **Core Language:** Always use **Ruby**.
- **Framework:** The framework for all code, tests, and architectural suggestions is always **Rails**.
- **Mental Model:** Think like Sandy Metz when she wrote Practical Object-Oriented Design in Ruby.
- **Code Style:** Whenever `.rubocop.yml` or any config files exist in `config/rubocop/` (such as `style.yml`, `rspec.yml`, `obsession.yml`, `layout.yml`, `metrics.yml`, `base.yml`), always read and apply their style, conventions, and rules in all code examples, code changes, and recommendations. If any of these files are not present, default to standard Ruby and Rails best practices.
- **Ruby Version:** Target Ruby 3.4.
- **Rails Version:** Target Rails 7.x (check Gemfile for specific version).
- **Exclusions:** Respect all file and directory exclusions as specified in `.rubocop.yml`, if it exists.
- **Gems & Dependencies:** Review and consider all gems and their versions listed in the `Gemfile` and `Gemfile.lock` when providing code examples, refactoring, or making library recommendations. Assume these gems are available in this project.
- **Testing & Plugins:** Apply cops and style from the following plugins **if present**:
  - rubocop-rspec
  - rubocop-performance
  - rubocop-rails
  - rubocop-factory_bot
  - rubocop-rspec_rails
  - rubocop-obsession
- **Temporary Files:** Always store temporary files, caches, or other transient data within the project's local `./tmp` directory. Avoid system-wide temporary directories to ensure consistency and isolation.

## Rails Best Practices
- **Database:** Default to PostgreSQL unless otherwise specified.
- **Controllers:** Keep controllers thin - they should only handle HTTP concerns.
- **Models:** Keep models focused on data and associations, extract complex logic to service objects.
- **Service Objects:** Place business logic in `app/services/` using single-responsibility classes.
- **Query Objects:** Place complex database queries in `app/queries/`.
- **Form Objects:** Use form objects in `app/forms/` for complex forms.
- **Concerns:** Use concerns sparingly and only for truly shared behavior.
- **Callbacks:** Use ActiveRecord callbacks sparingly - prefer explicit service objects.

## Testing Guidelines
- **Testing Framework:** Use RSpec for all tests.
- **Test Structure:** Follow the AAA pattern (Arrange, Act, Assert).
- **Factory Strategy:** Use FactoryBot for test data creation.
- **Test Coverage:** Write comprehensive tests for all business logic.
- **Test Location:** Follow Rails conventions - model specs in `spec/models/`, etc.

## Performance Considerations
- **N+1 Queries:** Always prevent N+1 queries using `includes`, `preload`, or `eager_load`.
- **Database Indexes:** Suggest indexes for foreign keys and commonly queried fields.
- **Caching:** Consider caching strategies for expensive operations.

## Security Best Practices
- **Strong Parameters:** Always use strong parameters in controllers.
- **SQL Injection:** Use parameterized queries, never interpolate user input directly.
- **Authentication:** Assume Devise or similar for authentication patterns.
- **Authorization:** Consider authorization needs (Pundit, CanCanCan, etc.).

## Error Handling
- **Exceptions:** Use custom exception classes in `app/exceptions/`.
- **Error Responses:** Follow standard HTTP status codes.
- **Logging:** Include appropriate logging for debugging.
- **User Communication:** Provide clear, helpful error messages.

## Background Jobs
- **Job Framework:** Check Gemfile for background job processor:
  - If `sidekiq` gem is present, use Sidekiq
  - If `solid_queue` gem is present, use Solid Queue
  - Otherwise, default to ActiveJob with the configured adapter
- **Job Placement:** Place job classes in `app/jobs/`.
- **Job Design:** Keep jobs idempotent and focused on a single task.

## Rails Infrastructure (if Solid gems are present)
- **Caching:** If `solid_cache` is present, use Solid Cache for caching needs.
- **WebSockets:** If `solid_cable` is present, use Solid Cable for ActionCable.
- **Background Jobs:** If `solid_queue` is present, use Solid Queue for job processing.

## General Principles
- **Readability:** Favor readable, maintainable, and idiomatic code over clever solutions.
- **SOLID Principles:** Apply SOLID principles, especially Single Responsibility.
- **DRY:** Don't Repeat Yourself, but don't abstract prematurely.
- **YAGNI:** You Aren't Gonna Need It - avoid over-engineering.
- **Clarification:** If uncertain about requirements or implementation, ask before proceeding.

> **Important:** Always check for `.rubocop.yml`, any files in `config/rubocop/`, and the `Gemfile` in this project, and use them for all code and architectural suggestions. If any are missing, use standard Ruby/Rails practices as your guide. Project-specific configurations always take precedence over these general guidelines.

