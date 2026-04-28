# Online Retail Shop

Online Retail Shop is an e-commerce prototype built with Ruby on Rails.  
It demonstrates a full shopping workflow with catalog browsing, category-based discovery, cart/shopping flows, invoicing, and basic account/authentication behavior.

The project is intended as a practical prototype for learning and iterating on modern Rails patterns for retail applications.

## Core Tech Choices

- **Ruby** `3.2.2`
- **Rails** `7.0.x`
- **Database** PostgreSQL (`pg`)
- **Frontend Interactivity** Hotwire:
  - `turbo-rails` for fast navigation and partial page updates
  - `stimulus-rails` (Stimulus controllers) for lightweight JavaScript behavior
- **Styling/UI**
  - `tailwindcss-rails`
  - `view_component` for reusable UI components
- **Authentication**
  - `sorcery`
  - `bcrypt`

## Testing Strategy

Testing is built around **RSpec** and common Rails testing tools:

- `rspec-rails` for model and feature/system-style tests
- `capybara` for browser-level user flow testing
- `factory_bot_rails` + `faker` for test data setup
- `shoulda-matchers` for concise model matcher specs
- `simplecov` for coverage reporting

## Gems in Use (Highlights)

### Application

- `rails`
- `pg`
- `puma`
- `importmap-rails`
- `turbo-rails`
- `stimulus-rails`
- `jbuilder`
- `sorcery`
- `bcrypt`
- `tailwindcss-rails`
- `view_component`
- `ruby_llm`

### Development / Test

- `rspec-rails`
- `capybara`
- `factory_bot_rails`
- `shoulda-matchers`
- `simplecov`
- `faker`
- `pry`
- `debug`
- `figaro`

## Getting Started

1. Install dependencies:
   - Ruby `3.2.2`
   - PostgreSQL
   - Bundler
2. Install gems:
   - `bundle install`
3. Set up the database:
   - `bin/rails db:create db:migrate db:seed`
4. Run the app:
   - `bin/rails server`
5. Visit:
   - `http://localhost:3000`

## Running Tests

Run the full RSpec suite:

```bash
bundle exec rspec
```
