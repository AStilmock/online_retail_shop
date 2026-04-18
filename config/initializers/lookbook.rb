# frozen_string_literal: true

return unless defined?(Lookbook)

Lookbook.configure do |config|
  config.preview_paths = [Rails.root.join("spec/components/previews")]
end
