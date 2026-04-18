# frozen_string_literal: true

module Ui
  class CardComponent < Ui::BaseComponent
    renders_one :header
    renders_one :footer

    def initialize(title: nil, padding: true, **html_options)
      @title = title
      @padding = padding
      @html_options = html_options
    end

    private

    attr_reader :title, :padding, :html_options

    def card_classes
      cn(
        "rounded-xl border border-secondary-200 bg-white shadow-card",
        html_options[:class]
      )
    end

    def body_classes
      padding ? "p-6" : ""
    end
  end
end
