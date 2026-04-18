# frozen_string_literal: true

module Ui
  class AlertComponent < Ui::BaseComponent
    VARIANTS = {
      notice: "bg-success-50 text-success-600 border-success-200",
      alert: "bg-danger-50 text-danger-700 border-danger-200",
      info: "bg-primary-50 text-primary-800 border-primary-200",
      warning: "bg-amber-50 text-amber-900 border-amber-200"
    }.freeze

    def initialize(message:, variant: :notice, dismissible: false, **html_options)
      @message = message
      @variant = variant.to_sym
      @dismissible = dismissible
      @html_options = html_options
    end

    private

    attr_reader :message, :variant, :dismissible, :html_options

    def alert_classes
      cn(
        "rounded-md border p-4 text-sm",
        VARIANTS.fetch(variant, VARIANTS[:notice]),
        html_options[:class]
      )
    end
  end
end
