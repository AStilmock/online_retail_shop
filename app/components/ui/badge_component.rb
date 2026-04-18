# frozen_string_literal: true

module Ui
  class BadgeComponent < Ui::BaseComponent
    VARIANTS = {
      default: "bg-secondary-100 text-secondary-800",
      primary: "bg-primary-100 text-primary-800",
      success: "bg-success-50 text-success-600",
      danger: "bg-danger-50 text-danger-700",
      outline: "border border-secondary-200 bg-white text-secondary-700"
    }.freeze

    def initialize(label:, variant: :default, **html_options)
      @label = label
      @variant = variant.to_sym
      @html_options = html_options
    end

    private

    attr_reader :label, :variant, :html_options

    def badge_classes
      cn(
        "inline-flex items-center rounded-full px-2.5 py-0.5 text-xs font-medium",
        VARIANTS.fetch(variant, VARIANTS[:default]),
        html_options[:class]
      )
    end
  end
end
