# UI component library

This app uses **ViewComponent** + **Tailwind** (via `tailwindcss-rails`) with **no npm toolchain**. Components live under `app/components/ui/` and use Stimulus for interactivity.

## Usage

```erb
<%= render Ui::ButtonComponent.new(label: "Save", variant: :primary, type: :submit) %>
<%= render Ui::LinkButtonComponent.new(href: root_path, label: "Home", variant: :ghost) %>
<%= render Ui::AlertComponent.new(message: flash[:notice], variant: :notice) %>
```

## Stimulus controllers

| Controller   | Purpose                                      |
|-------------|-----------------------------------------------|
| `modal`     | Open/close modal (targets: `panel`, `backdrop`) |
| `dropdown`  | Toggle menu (targets: `menu`, optional `button`) |
| `toast`     | Dismiss banners (`dismiss` action)            |

Example modal trigger: pass `data: { action: "click->modal#open" }` on a button inside the same subtree as `data-controller="modal"`.

## Previews (development)

- **Lookbook**: [http://localhost:3000/lookbook](http://localhost:3000/lookbook) (when `bin/rails server` is running)
- Preview classes: `spec/components/previews/ui/*_component_preview.rb`

## Tailwind

Design tokens are in `config/tailwind.config.js`. Form resets and `.ui-prose` live in `app/assets/stylesheets/application.tailwind.css` (replacing npm-only `@tailwindcss/forms` / `@tailwindcss/typography` plugins).
