# frozen_string_literal: true

module Ui
  class LinkButtonComponent < Ui::BaseComponent
    VARIANTS = ButtonComponent::VARIANTS
    SIZES = ButtonComponent::SIZES

    def initialize(
      href:,
      label:,
      variant: :primary,
      size: :md,
      full_width: false,
      method: nil,
      **html_options
    )
      @href = href
      @label = label
      @variant = variant.to_sym
      @size = size.to_sym
      @full_width = full_width
      @method = method
      @html_options = html_options
    end

    def link_options
      h = html_options.except(:class).dup
      h[:method] = method if method.present?
      h
    end

    private

    attr_reader :href, :label, :variant, :size, :full_width, :method, :html_options

    def link_classes
      cn(
        "inline-flex items-center justify-center gap-2 rounded-md font-medium shadow-sm transition-colors",
        "focus:outline-none focus-visible:ring-2 focus-visible:ring-offset-2",
        VARIANTS.fetch(variant, VARIANTS[:primary]),
        SIZES.fetch(size, SIZES[:md]),
        ("w-full" if full_width),
        html_options[:class]
      )
    end
  end
end
