# frozen_string_literal: true

module Ui
  class ButtonComponent < Ui::BaseComponent
    VARIANTS = {
      primary: "bg-primary-700 text-white hover:bg-primary-800 focus-visible:ring-primary-500",
      secondary: "bg-secondary-200 text-secondary-900 hover:bg-secondary-300 focus-visible:ring-secondary-400",
      danger: "bg-danger-600 text-white hover:bg-danger-700 focus-visible:ring-danger-500",
      outline: "border border-secondary-300 bg-white text-secondary-800 hover:bg-secondary-50 focus-visible:ring-primary-500",
      ghost: "bg-transparent text-primary-700 hover:bg-primary-50 focus-visible:ring-primary-500"
    }.freeze

    SIZES = {
      sm: "px-3 py-1.5 text-sm",
      md: "px-4 py-2 text-sm",
      lg: "px-5 py-2.5 text-base"
    }.freeze

    def initialize(
      label:,
      variant: :primary,
      size: :md,
      type: :button,
      full_width: false,
      disabled: false,
      **html_options
    )
      @label = label
      @variant = variant.to_sym
      @size = size.to_sym
      @type = type
      @full_width = full_width
      @disabled = disabled
      @html_options = html_options
    end

    private

    attr_reader :label, :variant, :size, :type, :full_width, :disabled, :html_options

    def button_classes
      cn(
        "inline-flex items-center justify-center gap-2 rounded-md font-medium shadow-sm transition-colors",
        "focus:outline-none focus-visible:ring-2 focus-visible:ring-offset-2",
        "disabled:pointer-events-none disabled:opacity-50",
        VARIANTS.fetch(variant, VARIANTS[:primary]),
        SIZES.fetch(size, SIZES[:md]),
        ("w-full" if full_width),
        html_options[:class]
      )
    end
  end
end
