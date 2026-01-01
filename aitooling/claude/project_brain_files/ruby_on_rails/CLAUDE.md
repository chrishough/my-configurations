# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

---

## Quick Reference

### Template Markers
When using this as a template for new projects, look for these markers:
- `[PROJECT-SPECIFIC]` - Must be updated for each project
- `[OPTIONAL]` - Remove section if not applicable to your project
- `[CUSTOMIZE]` - Adapt values/examples to project needs

### Essential Commands Quick Reference
| Task | Command |
|------|---------|
| Run all tests | `bundle exec rspec` |
| Run linter | `bundle exec rubocop` |
| Auto-fix lint | `bundle exec rubocop -a` |
| Start server | `bin/dev` |
| Console | `bin/rails console` |
| DB migrate | `bin/rails db:migrate` |
| Security scan | `bundle exec rake appfactory:test:brakeman` |

---

## Code Style & Project Guidelines

- **Core Language:** Always use **Ruby**.
- **Framework:** Rails 8.0.2 (per Gemfile) `[PROJECT-SPECIFIC]`
- **Ruby Version:** Ruby 3.4.3 (per .ruby-version) `[PROJECT-SPECIFIC]`
- **Mental Model:** Think like Sandy Metz when she wrote Practical Object-Oriented Design in Ruby.
- **Code Style:** Apply the style, conventions, and rules from `.rubocop.yml` and all config files in `config/rubocop/` (base.yml, rails.yml, rspec.yml, metrics.yml, layout.yml, obsession.yml). **IMPORTANT: All generated code MUST pass RuboCop checks without violations.**
- **Gems & Dependencies:** Review the `Gemfile` and `Gemfile.lock` when providing code examples. All listed gems are available.
- **Testing Plugins:** This project uses: `[CUSTOMIZE]`
  - rubocop-rspec
  - rubocop-performance
  - rubocop-rails
  - rubocop-factory_bot
  - rubocop-rspec_rails
  - rubocop-obsession
- **Temporary Files:** Always use the project's `./tmp` directory for temporary files.
- **Documentation Files:** All explanation, documentation, and reference markdown files (*.md) should be written to the `./tmp` directory, NOT to the project root or other directories, unless told otherwise.

---

## Essential Commands

### Development
```bash
bin/setup              # Initial setup: installs dependencies, prepares database, starts dev server
bin/dev                # Start Rails development server
bin/rails server       # Start Rails server directly
bin/rails console      # Open Rails console
```

### Testing
```bash
bundle exec rspec                                  # Run all tests
bundle exec rspec spec/services/                   # Run specific directory
bundle exec rspec spec/services/some_spec.rb      # Run specific file
bundle exec rspec spec/services/some_spec.rb:42   # Run specific line

bundle exec rake appfactory:test:simplecov         # Run tests with coverage [PROJECT-SPECIFIC]
bundle exec rake appfactory:test:rubocop           # Run RuboCop checks [PROJECT-SPECIFIC]
bundle exec rake appfactory:test:brakeman          # Run security analysis [PROJECT-SPECIFIC]
```

### Database
```bash
bin/rails db:prepare                               # Setup database
bin/rails db:migrate                               # Run migrations
bundle exec rake appfactory:database:reset         # Reset database [PROJECT-SPECIFIC]
bundle exec rake appfactory:database:recreate[development]  # Drop and recreate [PROJECT-SPECIFIC]
```

### Code Quality
```bash
bundle exec rubocop                                # Run all RuboCop checks
bundle exec rubocop -a                             # Auto-fix RuboCop violations
bundle exec rubocop spec/services/some_spec.rb    # Check specific file
```

---

## Project Directory Structure

```
app/
├── assets/              # Static assets (stylesheets, images)
├── builders/            # Builder pattern for complex object construction [OPTIONAL]
├── controllers/         # HTTP request handlers (keep thin!)
├── forms/               # Form objects for complex multi-model forms
├── helpers/             # View helpers (use sparingly)
├── inputs/              # Input objects for request parameter parsing [OPTIONAL]
├── jobs/                # Background jobs (Solid Queue)
├── lib/                 # App-dependent library code (e.g., Rodauth config)
├── mailers/             # ActionMailer classes (prefer service objects)
├── models/              # ActiveRecord models (data + associations only)
├── policies/            # Pundit authorization policies
├── presenters/          # View presenters/decorators [OPTIONAL]
├── queries/             # Query objects for complex database queries
├── services/            # ServiceWrapper business logic (primary location)
├── validators/          # Custom ActiveModel validators
├── views/               # Slim templates
└── workers/             # Legacy background workers [OPTIONAL]

config/
├── environments/        # Environment-specific configuration
├── initializers/        # Boot-time initialization
├── locales/             # I18n translation files
├── rubocop/             # Modular RuboCop configuration
└── settings/            # Application settings (config gem)

lib/
├── core_extensions/     # Core Ruby class extensions
├── monkey_patches/      # Runtime modifications (use sparingly)
├── modules/             # Reusable utility modules
├── tasks/               # Custom Rake tasks
└── utilities/           # Helper utilities

spec/
├── factories/           # FactoryBot test data definitions
├── fixtures/            # VCR cassettes and test files
├── support/             # Test helpers, shared examples, configs
│   ├── configs/         # Test framework configurations
│   ├── helpers/         # Custom test helper modules
│   ├── matchers/        # Custom RSpec matchers
│   ├── modules/         # Utility modules for tests
│   ├── shared_contexts/ # Shared context setups
│   └── shared_examples/ # Reusable test patterns
├── controllers/         # Controller specs
├── features/            # Feature/system specs
├── jobs/                # Background job specs
├── models/              # Model specs
├── policies/            # Policy specs
├── requests/            # Request/integration specs
├── services/            # Service object specs
└── validators/          # Validator specs
```

### Where to Put New Code
| Code Type | Location | When to Use |
|-----------|----------|-------------|
| Business logic | `app/services/` | Any logic involving multiple models, external services, or complex operations |
| Database queries | `app/queries/` | Complex queries with joins, aggregations, or multiple conditions |
| Form handling | `app/forms/` | Multi-model forms, complex validations spanning models |
| Request parsing | `app/inputs/` | Complex parameter parsing, API request objects |
| View logic | `app/presenters/` | Complex view logic, formatting, calculated display values |
| Authorization | `app/policies/` | Access control, permission checks |
| Object construction | `app/builders/` | Objects with many optional parameters, step-by-step construction |
| Custom validations | `app/validators/` | Reusable validation rules across models |
| Background work | `app/jobs/` | Async operations, scheduled tasks, expensive computations |

---

## Architecture Overview

### Service Object Pattern
All business logic uses the ServiceWrapper pattern. Services must:
- Inherit from `ServiceWrapper`
- Define `_local_initialize` for setup (private, underscore prefix)
- Define `_local_call` for business logic (private, underscore prefix)
- Use `validates` for input validation
- Return data via `@response`

Example structure with proper private method naming:
```ruby
# frozen_string_literal: true

module Services
  module User
    class CreateAccount < ServiceWrapper
      validates :email, presence: true
      validate :_email_format_valid?

      private

      attr_accessor :email, :user

      def _local_initialize(email:)
        self.email = email
      end

      def _local_call
        self.user = _create_user
        _send_welcome_email

        @response = { user: user }
      end

      def _email_format_valid?
        return if email.match?(URI::MailTo::EMAIL_REGEXP)

        errors.add(:email, I18n.t("services.user.create_account.errors.invalid_email"))
      end

      def _create_user
        ::Account.create!(email: email, status: :unverified)
      end

      def _send_welcome_email
        ::Mail::WelcomeJob.perform_later(user_id: user.id)
      end
    end
  end
end
```

Usage:
```ruby
result = Services::User::CreateAccount.call(email: "user@example.com")
if result.valid?
  user = result.response[:user]
else
  errors = result.errors
end
```

### Query Objects
Extract complex ActiveRecord queries into dedicated classes:

```ruby
# frozen_string_literal: true

module Queries
  class ActiveLeadsByDateRange
    def initialize(account:, start_date:, end_date:)
      @account = account
      @start_date = start_date
      @end_date = end_date
    end

    def call
      _base_scope
        .where(created_at: @start_date..@end_date)
        .includes(:tags, :notes)
        .order(created_at: :desc)
    end

    private

    def _base_scope
      @account.leads.active
    end
  end
end

# Usage
leads = Queries::ActiveLeadsByDateRange.new(
  account: current_account,
  start_date: 30.days.ago,
  end_date: Time.current,
).call
```

### Form Objects
Handle complex forms that span multiple models:

```ruby
# frozen_string_literal: true

module Forms
  class UserRegistration
    include ActiveModel::Model
    include ActiveModel::Validations

    attr_accessor :email, :password, :company_name, :terms_accepted

    validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }
    validates :password, presence: true, length: { minimum: 10 }
    validates :company_name, presence: true
    validates :terms_accepted, acceptance: true

    def save
      return false unless valid?

      ActiveRecord::Base.transaction do
        _create_account
        _create_company
        true
      end
    rescue ActiveRecord::RecordInvalid => e
      errors.add(:base, e.message)
      false
    end

    private

    def _create_account
      @account = Account.create!(email: email, password: password)
    end

    def _create_company
      @company = @account.companies.create!(name: company_name)
    end
  end
end
```

### Input Objects `[OPTIONAL]`
Parse and validate incoming request parameters:

```ruby
# frozen_string_literal: true

module Inputs
  class LeadSearchInput
    include ActiveModel::Model

    attr_accessor :query, :status, :date_from, :date_to, :page, :per_page

    def initialize(params = {})
      @query = params[:q]&.strip
      @status = params[:status]&.to_sym
      @date_from = _parse_date(params[:date_from])
      @date_to = _parse_date(params[:date_to])
      @page = (params[:page] || 1).to_i
      @per_page = [(params[:per_page] || 25).to_i, 100].min
    end

    private

    def _parse_date(value)
      return nil if value.blank?

      Time.zone.parse(value)
    rescue ArgumentError
      nil
    end
  end
end
```

### Presenter Objects `[OPTIONAL]`
Encapsulate complex view logic:

```ruby
# frozen_string_literal: true

module Presenters
  class LeadPresenter
    def initialize(lead)
      @lead = lead
    end

    def full_name
      "#{@lead.first_name} #{@lead.last_name}".strip
    end

    def status_badge_class
      case @lead.status
      when :active then "badge-success"
      when :pending then "badge-warning"
      when :closed then "badge-secondary"
      else "badge-info"
      end
    end

    def formatted_phone
      return "N/A" if @lead.phone_number.blank?

      _format_phone_number(@lead.phone_number)
    end

    def created_at_relative
      time_ago_in_words(@lead.created_at)
    end

    private

    def _format_phone_number(number)
      # Format: (555) 123-4567
      cleaned = number.gsub(/\D/, "")
      return number unless cleaned.length == 10

      "(#{cleaned[0..2]}) #{cleaned[3..5]}-#{cleaned[6..9]}"
    end
  end
end
```

### Policy Objects
Pundit policies for authorization: `[PROJECT-SPECIFIC]`

```ruby
# frozen_string_literal: true

class LeadPolicy < ApplicationPolicy
  def index?
    _user_has_account?
  end

  def show?
    _user_owns_record?
  end

  def create?
    _user_has_account?
  end

  def update?
    _user_owns_record?
  end

  def destroy?
    _user_owns_record? && !record.has_active_deals?
  end

  class Scope < ApplicationPolicy::Scope
    def resolve
      scope.where(account: user.account)
    end
  end

  private

  def _user_has_account?
    user.account.present?
  end

  def _user_owns_record?
    record.account_id == user.account_id
  end
end
```

### Builder Objects `[OPTIONAL]`
Construct complex objects with many optional parameters:

```ruby
# frozen_string_literal: true

module Builders
  class ReportBuilder
    def initialize
      @filters = {}
      @columns = []
      @sort_by = nil
      @format = :html
    end

    def with_date_range(start_date, end_date)
      @filters[:date_range] = start_date..end_date
      self
    end

    def with_status(status)
      @filters[:status] = status
      self
    end

    def with_columns(*columns)
      @columns = columns.flatten
      self
    end

    def sorted_by(column, direction = :asc)
      @sort_by = { column: column, direction: direction }
      self
    end

    def as_format(format)
      @format = format
      self
    end

    def build
      Report.new(
        filters: @filters,
        columns: @columns,
        sort_by: @sort_by,
        format: @format,
      )
    end
  end
end

# Usage
report = Builders::ReportBuilder.new
  .with_date_range(30.days.ago, Time.current)
  .with_status(:active)
  .with_columns(:name, :email, :created_at)
  .sorted_by(:created_at, :desc)
  .as_format(:csv)
  .build
```

### Value Objects `[OPTIONAL]`
Immutable objects representing domain concepts:

```ruby
# frozen_string_literal: true

class Money
  include Comparable

  attr_reader :cents, :currency

  def initialize(cents, currency = "USD")
    @cents = cents.to_i
    @currency = currency.to_s.upcase.freeze
    freeze
  end

  def dollars
    cents / 100.0
  end

  def +(other)
    _ensure_same_currency!(other)
    self.class.new(cents + other.cents, currency)
  end

  def -(other)
    _ensure_same_currency!(other)
    self.class.new(cents - other.cents, currency)
  end

  def *(multiplier)
    self.class.new((cents * multiplier).round, currency)
  end

  def <=>(other)
    return nil unless other.is_a?(Money) && currency == other.currency

    cents <=> other.cents
  end

  def to_s
    format("$%.2f %s", dollars, currency)
  end

  private

  def _ensure_same_currency!(other)
    return if currency == other.currency

    raise ArgumentError, "Cannot operate on different currencies: #{currency} vs #{other.currency}"
  end
end
```

### Null Objects `[OPTIONAL]`
Handle nil cases elegantly:

```ruby
# frozen_string_literal: true

class NullAccount
  def id
    nil
  end

  def email
    "guest@example.com"
  end

  def name
    "Guest"
  end

  def verified?
    false
  end

  def can_access?(_resource)
    false
  end

  def leads
    Lead.none
  end
end

# Usage in controller
def current_account
  @current_account ||= Account.find_by(id: session[:account_id]) || NullAccount.new
end
```

### Authentication Architecture `[PROJECT-SPECIFIC]`
- Uses Rodauth (not Devise) for authentication
- Configuration in `app/lib/rodauth_app.rb` and `rodauth_main.rb`
- Mounted at `/authentication` routes
- Database tables: `accounts`, `account_verification_keys`, `account_password_reset_keys`, etc.

### Background Processing
- **Job Framework**: Solid Queue (per Gemfile) - all jobs in `app/jobs/`
- **Caching**: Solid Cache for Rails caching needs
- **WebSockets**: Solid Cable for ActionCable
- **Job Design**: Keep jobs idempotent and focused on a single task
- All background jobs inherit from `ApplicationJob`
- **CRITICAL**: All jobs must be idempotent - safe to run multiple times with same arguments

```ruby
# frozen_string_literal: true

class ImportLeadsJob < ApplicationJob
  queue_as :default

  def perform(import_id:)
    import = LeadImport.find(import_id)
    return if import.completed? # Idempotency check

    Services::Leads::ProcessImport.call(import: import)
  end
end
```

### Email Services `[PROJECT-SPECIFIC]`
Emails are sent via service objects, not traditional Rails mailers:
- `Services::Email::SendAccountVerificationEmail`
- `Services::Email::SendPasswordResetEmail`
- Uses SendGrid for production email delivery

### Testing Patterns
- All services have corresponding specs in `spec/services/`
- Use shared examples: `it_behaves_like "a valid service response"`
- VCR cassettes for external API calls
- FactoryBot for test data

### Frontend Architecture `[PROJECT-SPECIFIC]`
- **Templates**: Slim (not ERB)
- **JavaScript**: Import maps + Stimulus controllers
- **CSS**: SCSS with Propshaft
- **Interactivity**: Hotwire (Turbo + Stimulus)

---

## Key Conventions

### Service Response Structure
Services always return an object with:
- `valid?` - boolean indicating success
- `errors` - ActiveModel::Errors object (with `raw`, `text`, `translated`, `error_count`)
- `response` - hash containing returned data

### Validation Pattern
Services validate inputs before execution:
```ruby
validates :required_param, presence: true
validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
validate :_custom_validation_method  # Note underscore prefix
```

### Error Handling in Services
Errors use I18n translations from `config/locales/`:
- Service errors: `services.module.class_name.errors.error_key`
- Model errors: Standard Rails I18n patterns

```ruby
def _validate_email
  return if _email_valid?

  errors.add(:email, I18n.t("services.mail.verification.errors.email_invalid"))
end
```

### Database Migrations
Uses Rein gem for database constraints:
```ruby
add_presence_constraint :table, :column
add_foreign_key_constraint :table, :foreign_table
```

### RuboCop Configuration
Located in `config/rubocop/` with separate files:
- `base.yml` - Core Ruby style
- `rails.yml` - Rails-specific rules
- `rspec.yml` - RSpec style
- `metrics.yml` - Complexity metrics
- `layout.yml` - Code layout rules
- `obsession.yml` - Method obsession checks

Key enforced styles:
- Double quotes for strings
- Trailing commas in multi-line hashes/arrays
- Parentheses required for method calls (except in specs)
- **CRITICAL: All private methods MUST have an underscore prefix** (e.g., `_calculate_total`, `_validate_input`) - This is a mandatory convention for ALL Ruby code in this project

### Model Conventions
Order within model files:
```ruby
class Lead < ApplicationRecord
  # 1. Constants
  STATUSES = %i[active pending closed].freeze

  # 2. Attribute declarations (enums, etc.)
  enum :status, { active: 0, pending: 1, closed: 2 }, default: :pending

  # 3. Associations (belongs_to first, then has_many, then has_one)
  belongs_to :account
  has_many :notes, dependent: :destroy
  has_one :primary_contact, class_name: "Contact"

  # 4. Validations
  validates :email, presence: true, uniqueness: { scope: :account_id }
  validates :status, inclusion: { in: STATUSES }

  # 5. Scopes
  scope :active, -> { where(status: :active) }
  scope :recent, -> { order(created_at: :desc) }

  # 6. Callbacks (use sparingly - prefer service objects)
  before_validation :_normalize_email, if: :email_changed?

  # 7. Class methods
  def self.search(query)
    where("email ILIKE ?", "%#{query}%")
  end

  # 8. Public instance methods
  def full_name
    "#{first_name} #{last_name}".strip
  end

  # 9. Private methods (with underscore prefix)
  private

  def _normalize_email
    self.email = email&.downcase&.strip
  end
end
```

### Controller Conventions
Order within controller files:
```ruby
class LeadsController < ApplicationController
  # 1. before_action declarations
  before_action :authenticate!
  before_action :_set_lead, only: %i[show edit update destroy]

  # 2. Standard RESTful actions (in order: index, show, new, create, edit, update, destroy)
  def index
    @leads = policy_scope(Lead).page(params[:page])
  end

  def show; end

  def new
    @lead = Lead.new
  end

  def create
    @lead = current_account.leads.build(_lead_params)
    if @lead.save
      redirect_to @lead, notice: t(".success")
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit; end

  def update
    if @lead.update(_lead_params)
      redirect_to @lead, notice: t(".success")
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @lead.destroy
    redirect_to leads_path, notice: t(".success")
  end

  # 3. Custom public actions
  def export
    # ...
  end

  # 4. Private methods (with underscore prefix)
  private

  def _set_lead
    @lead = policy_scope(Lead).find(params[:id])
    authorize @lead
  end

  def _lead_params
    params.require(:lead).permit(:email, :first_name, :last_name, :phone_number, :status)
  end
end
```

### Time Handling
- **Always use `Time.zone.now`**, never `Time.now` or `DateTime.now`
- Store all times in UTC in the database
- Use `freeze_time` or `travel_to` in tests for deterministic time
- Parse user input with `Time.zone.parse`
- Display times using I18n localization: `l(time, format: :short)`

```ruby
# Good
Time.zone.now
Time.zone.today
1.day.ago
Time.zone.parse("2024-01-15")

# Bad - Never use these
Time.now
Date.today
DateTime.now
Time.parse("2024-01-15")
```

---

## Database Conventions

### Naming Conventions
- **Tables**: Plural, snake_case (`leads`, `account_settings`, `password_reset_keys`)
- **Columns**: Singular, snake_case (`first_name`, `created_at`, `account_id`)
- **Foreign keys**: `{table_singular}_id` (`account_id`, `lead_id`)
- **Indexes**: `index_{table}_on_{columns}` (auto-generated by Rails)
- **Join tables**: Alphabetical order (`accounts_roles`, `leads_tags`)

### Primary Keys
- Use integer IDs for internal references (default Rails behavior)
- Consider UUIDs for external-facing identifiers (API responses, URLs)
- Never expose sequential IDs in public URLs if order/count is sensitive

### Index Strategies
```ruby
# Always index foreign keys
add_index :leads, :account_id

# Index columns used in WHERE clauses
add_index :leads, :status
add_index :leads, :email

# Composite indexes - put equality columns first, range columns last
add_index :leads, [:account_id, :status, :created_at]

# Partial indexes for filtered queries
add_index :leads, :email, where: "status = 'active'", name: "index_active_leads_on_email"

# Unique constraints
add_index :accounts, :email, unique: true

# Index for ORDER BY queries
add_index :leads, [:account_id, :created_at], order: { created_at: :desc }
```

### Query Optimization Patterns
```ruby
# Use includes for belongs_to/has_many that will be accessed
Lead.includes(:account, :tags).where(status: :active)

# Use preload when you need separate queries (useful for complex conditions)
Lead.preload(:notes).where(status: :active)

# Use eager_load for LEFT OUTER JOIN (when filtering by association)
Lead.eager_load(:notes).where(notes: { important: true })

# Use exists? instead of loading records
Lead.where(account: account).exists?  # Good
Lead.where(account: account).any?     # Loads records - avoid

# Use pluck for single columns
Lead.where(status: :active).pluck(:email)  # Returns array of strings

# Use select to limit columns
Lead.select(:id, :email, :status).where(status: :active)

# Use find_each for batch processing
Lead.where(status: :pending).find_each(batch_size: 100) do |lead|
  # Process each lead
end

# Use update_all for bulk updates
Lead.where(status: :pending).update_all(status: :active)

# Use insert_all for bulk inserts (Rails 6+)
Lead.insert_all([{ email: "a@b.com" }, { email: "c@d.com" }])
```

---

## RuboCop Compliance

**CRITICAL: All code must pass RuboCop checks.** Before finalizing any code:
- Run `bundle exec rubocop <file>` on new/modified files
- Fix all violations - do not disable cops without explicit user approval
- Common patterns to follow:
  - Use frozen string literal comment: `# frozen_string_literal: true`
  - Add proper spacing around operators and after commas
  - Use consistent indentation (2 spaces)
  - Keep lines under the configured length limit
  - Use descriptive variable and method names
  - Follow the configured naming conventions
  - In specs, use proper RSpec style (no parentheses for matchers)
  - **All private methods must start with underscore**

---

## Rails Best Practices

- **Database:** PostgreSQL with Rein for database integrity
- **Controllers:** Keep controllers thin - they only handle HTTP concerns (params, response, redirects)
- **Models:** Keep models focused on data and associations, extract complex logic to service objects
- **Service Objects:** Business logic in `app/services/` using single-responsibility classes (ServiceWrapper pattern)
- **Query Objects:** Place complex database queries in `app/queries/`
- **Form Objects:** Use form objects in `app/forms/` for complex multi-model forms
- **Input Objects:** Use input objects in `app/inputs/` for complex request parameter parsing
- **Presenters:** Use presenters in `app/presenters/` for complex view logic
- **Policies:** Use Pundit policies in `app/policies/` for authorization
- **Concerns:** Use concerns sparingly and only for truly shared, cohesive behavior
- **Callbacks:** Use ActiveRecord callbacks sparingly - prefer explicit service objects
  - **Never use callbacks for**: sending emails, calling APIs, touching other models, or complex side effects

---

## Testing Guidelines

- **Testing Framework:** RSpec for all tests
- **Test Structure:** Follow the AAA pattern (Arrange, Act, Assert)
- **Factory Strategy:** FactoryBot for test data creation - ALWAYS use factories, never create records directly
- **Test Coverage:** Write comprehensive tests for all business logic
- **Test Location:** Follow Rails conventions - model specs in `spec/models/`, service specs in `spec/services/`, etc.
- **Shared Examples:** Use `it_behaves_like "a valid service response"` for service tests
- **VCR:** Use VCR cassettes for external API calls
- **Request Specs:** Prefer request specs over controller specs for full-stack testing
- **Feature Specs:** Use sparingly - prefer request specs for better performance

### Factory Conventions
```ruby
# Always use factories - never create records directly in specs
let(:account) { create(:account) }
let(:lead) { create(:lead, account: account) }

# Use traits for variations
let(:verified_account) { create(:account, :verified) }

# Use build for objects that don't need persistence
let(:lead) { build(:lead, email: "test@example.com") }

# Use sequences for unique values
sequence(:email) { |n| "user#{n}@example.com" }
```

### Service Testing Pattern
```ruby
RSpec.describe Services::User::CreateAccount, type: :service do
  describe ".call" do
    context "when valid" do
      subject(:service) { described_class.call(email: "user@example.com") }

      it_behaves_like "a valid service response" do
        let(:service_response) { service }
        let(:response) { be_a(Account) }
      end
    end

    context "when invalid" do
      subject(:service) { described_class.call(email: nil) }

      it_behaves_like "an invalid service response" do
        let(:service_response) { service }
        let(:error_array) do
          [[:email, I18n.t("services.user.create_account.errors.email_required")]]
        end
      end
    end
  end
end
```

### Test Anti-Patterns to Avoid
- Don't test private methods directly
- Don't use hardcoded IDs (use `-1` for nonexistent records)
- Don't use `sleep` - use proper waiting conditions
- Don't mock ActiveRecord in integration tests
- Don't write specs with multiple unrelated expectations
- Don't depend on specific data ordering without explicit `ORDER BY`

---

## Anti-Patterns to Avoid

### Architecture Anti-Patterns
- **Don't use ActiveRecord models as service objects** - models handle data, services handle business logic
- **Don't put business logic in controllers, views, or callbacks** - use service objects
- **Don't use before_save/after_save for cross-model operations** - use explicit service transactions
- **Don't create services with multiple public methods** - one service, one purpose
- **Don't use concerns as dumping grounds** - only for truly shared, cohesive behavior
- **Don't use callbacks for emails, APIs, or side effects** - make these explicit in services
- **Don't use default_scope** - causes hidden complexity and unexpected behavior
- **Don't create deeply nested modules** - keep namespace depth reasonable (max 3 levels)

### Code Organization Anti-Patterns
- **Don't put query logic in controllers or views** - use query objects or scopes
- **Don't put presentation logic in models** - use presenters
- **Don't put business logic in helpers** - use services or presenters
- **Don't use class inheritance when composition is clearer** - prefer modules and delegation
- **Don't use update_attribute/update_column** unless you explicitly need to skip validations
- **Don't create conditional logic based on Rails.env** - extract to configuration

### Testing Anti-Patterns
- **Don't write model specs testing ActiveRecord functionality** - Rails already tests this
- **Don't write unit tests requiring database when logic can be tested in isolation**
- **Don't use fixtures** - use factories with explicit attributes
- **Don't test private methods directly** - test through public interface
- **Don't use hardcoded IDs** - use `-1` for nonexistent record tests
- **Don't use sleep statements** - use proper waiting/polling conditions
- **Don't mock ActiveRecord models in integration tests**
- **Don't write specs with multiple expectations testing different behaviors**

### Metaprogramming Anti-Patterns
- **Don't add "clever" metaprogramming** that obscures control flow
- **Avoid method_missing** unless absolutely necessary
- **Don't use global refinements** - they're confusing and break tooling
- **Don't monkey-patch core classes** in application code (lib/monkey_patches is exception)

---

## Code Review Checklist

### Code Quality & Readability
- [ ] Method and variable names clearly express their purpose
- [ ] Methods do exactly what their names suggest, no more and no less
- [ ] Code reads like well-written prose with early returns reducing nesting
- [ ] No debug statements, console logs, or print statements remain
- [ ] Complex algorithms and business logic have explanatory "why" comments
- [ ] Magic numbers and strings extracted to named constants
- [ ] No deeply nested conditionals (max 3 levels)
- [ ] No "clever" code sacrificing readability for brevity
- [ ] All private methods have underscore prefix

### Architecture & Organization
- [ ] Functions and methods follow single responsibility principle
- [ ] Proper abstraction levels - high-level doesn't mix with low-level details
- [ ] No code duplication - shared logic extracted appropriately
- [ ] File and class organization follows project structure
- [ ] No circular dependencies between modules
- [ ] Inheritance hierarchies are shallow and purposeful
- [ ] Public/private visibility is appropriate

### Error Handling & Edge Cases
- [ ] Error messages provide actionable information
- [ ] Consistent error handling patterns across similar operations
- [ ] No empty catch blocks or silently swallowed exceptions
- [ ] Collection operations handle empty collections gracefully
- [ ] Boundary conditions explicitly handled (null, zero, empty, max)
- [ ] Methods have predictable, consistent return types

### Testing
- [ ] Test descriptions clearly express what is being tested
- [ ] Tests validate behavior, not implementation details
- [ ] Tests use factories, not fixtures
- [ ] No hardcoded IDs or database-generated values in tests

### Security
- [ ] No credentials, tokens, or secrets in code
- [ ] User input is validated and sanitized
- [ ] Strong parameters properly configured
- [ ] SQL queries use parameterization

### Maintenance
- [ ] TODO comments include ticket numbers
- [ ] No commented-out code without justification
- [ ] No temporary code or experimental features being merged
- [ ] Configuration values externalized

---

## Performance Considerations

### Query Optimization
- **N+1 Queries:** Always prevent using `includes`, `preload`, or `eager_load`
- **Database Indexes:** Add indexes for foreign keys and commonly queried fields
- **Batch Processing:** Use `find_each` and `in_batches` for large datasets
- **Bulk Operations:** Use `update_all` and `insert_all` instead of iterating
- **Select Specific Columns:** Use `pluck` or `select` when you don't need full records
- **EXISTS Queries:** Use `exists?` instead of loading associations to check presence

### Memoization
Use memoization for expensive computations within request cycles:

```ruby
def _current_subscription
  @current_subscription ||= account.subscriptions.active.first
end

# For methods that might return nil or false
def _cached_feature_flag
  return @cached_feature_flag if defined?(@cached_feature_flag)

  @cached_feature_flag = FeatureFlag.enabled?(:new_dashboard)
end
```

### Caching
- Use Solid Cache for Rails caching needs
- Fragment caching for expensive view partials
- Low-level caching for computed values
- Cache invalidation strategy must be explicit

### Background Jobs
- Use Solid Queue for expensive operations
- Keep jobs idempotent and focused
- Use appropriate queue priorities
- Monitor job performance and failures

---

## Security Best Practices

### Environment Variables & Secrets
- **NEVER read `.env` files** - they contain sensitive credentials, API keys, and secrets
- Use `.env.example` as reference for required environment variables
- For environment configuration questions, refer to `.env.example` only
- All secrets must be stored in environment variables, never hardcoded
- **NEVER read Rails credentials files directly** (`config/credentials.yml.enc`, `config/master.key`)

### Rails Credentials Access
When you need credential values for documentation or examples:
```ruby
# Access credentials in code (never read the encrypted file directly)
Rails.application.credentials.dig(:sendgrid, :api_key)
Rails.application.credentials.secret_key_base

# Environment-specific credentials
Rails.application.credentials.dig(Rails.env.to_sym, :database, :password)
```

### Strong Parameters
Controllers handling user input MUST implement strong parameters:

- **Include StrongParameters concern** for common patterns
- **Define explicit permit lists** for each action
- **Use `params.require(:model).permit(...)`** for standard CRUD
- **Use `params.expect(model: [...])` in Rails 8+** for enhanced type safety
- **Never use `params.permit!`** in production code

Example:
```ruby
class LeadsController < ApplicationController
  private

  def _lead_params
    params.require(:lead).permit(:email, :first_name, :last_name, :phone_number, :status)
  end
end
```

### Additional Security Measures
- **SQL Injection:** Use parameterized queries, never interpolate user input
- **Authentication:** Rodauth for authentication (NOT Devise) `[PROJECT-SPECIFIC]`
- **Authorization:** Pundit for authorization policies
- **Security Scanning:** Run `bundle exec rake appfactory:test:brakeman` regularly
- **CSRF:** Ensure CSRF protection is enabled (Rails default)
- **XSS:** Use Rails' built-in escaping, be careful with `html_safe`

---

## Error Handling

- **Service Pattern:** All services return structured responses with `errors` and `valid?`
- **I18n:** Use translations for all error messages from `config/locales/`
- **Error Responses:** Follow standard HTTP status codes
- **Logging:** Include appropriate logging for debugging
- **User Communication:** Provide clear, helpful error messages via I18n
- **Exception Classes:** Create specialized exception classes for domain errors

```ruby
# Custom exception example
module Errors
  class InvalidLeadError < StandardError
    attr_reader :lead, :validation_errors

    def initialize(lead, validation_errors)
      @lead = lead
      @validation_errors = validation_errors
      super("Lead #{lead.id} is invalid: #{validation_errors.full_messages.join(', ')}")
    end
  end
end
```

---

## Logging Standards

### Log Levels
- **debug:** Detailed diagnostic information for development
- **info:** General operational events (requests, jobs started/completed)
- **warn:** Unexpected but handled situations
- **error:** Errors that need attention but don't crash the app
- **fatal:** Critical errors causing app termination

### What to Log
```ruby
# Service entry/exit with context
Rails.logger.info("Starting lead import", import_id: import.id, row_count: rows.count)
Rails.logger.info("Lead import completed", import_id: import.id, created: created_count, failed: failed_count)

# External API calls
Rails.logger.info("SendGrid API request", endpoint: "/mail/send", recipient: email)
Rails.logger.warn("SendGrid API retry", attempt: attempt, error: error.message)

# Errors with context
Rails.logger.error("Lead creation failed", account_id: account.id, errors: lead.errors.full_messages)
```

### What NOT to Log
- Passwords, tokens, API keys, or secrets
- Full credit card numbers or sensitive PII
- Large request/response bodies (log summary instead)
- Health check requests (too noisy)

---

## API Conventions `[OPTIONAL - Remove if not building APIs]`

### Response Structure
```json
// Success response
{
  "data": {
    "id": "123",
    "type": "lead",
    "attributes": {
      "email": "user@example.com",
      "status": "active"
    }
  },
  "meta": {
    "request_id": "abc-123",
    "timestamp": "2024-01-15T10:30:00Z"
  }
}

// Error response
{
  "error": {
    "code": "validation_failed",
    "message": "The request could not be processed",
    "details": [
      { "field": "email", "message": "is invalid" }
    ]
  },
  "meta": {
    "request_id": "abc-123"
  }
}

// Collection response
{
  "data": [...],
  "meta": {
    "total_count": 100,
    "page": 1,
    "per_page": 25
  },
  "links": {
    "next": "/api/leads?page=2",
    "prev": null
  }
}
```

### HTTP Status Codes
- `200 OK` - Successful GET, PUT, PATCH
- `201 Created` - Successful POST creating a resource
- `204 No Content` - Successful DELETE
- `400 Bad Request` - Malformed request syntax
- `401 Unauthorized` - Missing or invalid authentication
- `403 Forbidden` - Authenticated but not authorized
- `404 Not Found` - Resource doesn't exist
- `422 Unprocessable Entity` - Validation errors
- `500 Internal Server Error` - Unexpected server error

---

## Browser Automation & E2E Testing

When browser automation is needed (testing pages, filling forms, taking screenshots, validating UX, testing login flows, etc.), use the Playwright skill:

```
skill: "playwright-skill"
```

This skill provides complete browser automation with Playwright. It can:
- Auto-detect dev servers
- Write clean test scripts to /tmp
- Test pages and fill forms
- Take screenshots
- Check responsive design
- Validate UX flows
- Test login flows and authentication
- Check links and automate any browser task

---

## General Principles

- **Readability:** Favor readable, maintainable, and idiomatic code over clever solutions
- **SOLID Principles:** Apply SOLID principles, especially Single Responsibility (ServiceWrapper pattern)
- **DRY:** Don't Repeat Yourself, but don't abstract prematurely
- **YAGNI:** You Aren't Gonna Need It - avoid over-engineering
- **Sandy Metz Rules:** Small methods, small classes, tell don't ask
- **Clarification:** If uncertain about requirements or implementation, ask before proceeding
- **Browser Testing:** Always explicitly close the browser when done: `mcp__playwright__browser_close()`
- **Process Cleanup:** CRITICAL - Always stop any process that is started during the prompt:
  - **BEFORE starting work:** Check for running processes: `ps aux | grep -E "ruby|rails|puma|node" | grep -v grep`
  - **AFTER work is complete:** Kill ALL processes started during this session: `pkill -f puma`
  - **EVERY Rails server, background job, or Node process you start MUST be stopped before the prompt ends**
  - Use `pkill -f puma` to stop Rails servers, `pkill -f node` for Node processes
  - This MUST be done every single time to prevent resource leaks and port conflicts
  - Do NOT leave background processes running when the task is complete
- **Test File Cleanup:** ALWAYS delete any test files created during debugging unless explicitly told to keep them:
  - Delete test HTML files created in public/
  - Delete any temporary test scripts or files
  - Clean up immediately after verification is complete
  - Only keep test files if user explicitly says "save" or "keep"

---

## Deployment Instructions

- **Heroku:** NEVER push to Heroku unless explicitly confirmed with "yes" or "no" from the user `[PROJECT-SPECIFIC]`

---

## Template Customization Guide

When using this CLAUDE.md as a template for a new project, update the following:

### Required Updates
1. **Ruby/Rails versions** in Code Style section
2. **Essential Commands** - update rake task namespaces
3. **Project Directory Structure** - add/remove directories based on patterns used
4. **Authentication Architecture** - update if not using Rodauth
5. **Frontend Architecture** - update based on actual stack
6. **Email Services** - update provider and service class names
7. **Deployment Instructions** - update for your deployment platform

### Optional Sections to Remove
- `[OPTIONAL]` marked sections if not applicable:
  - Input Objects (if not parsing complex params)
  - Presenter Objects (if views are simple)
  - Builder Objects (if not constructing complex objects)
  - Value Objects (if not using domain value types)
  - Null Objects (if not using null object pattern)
  - API Conventions (if not building APIs)

### Template Markers Reference
- `[PROJECT-SPECIFIC]` - Must change for each project
- `[OPTIONAL]` - Remove entire section if not used
- `[CUSTOMIZE]` - Adapt list/values to project needs
