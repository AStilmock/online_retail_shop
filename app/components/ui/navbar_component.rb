# frozen_string_literal: true

module Ui
  class NavbarComponent < Ui::BaseComponent
    def initialize(**html_options)
      @html_options = html_options
    end

    private

    attr_reader :html_options

    def nav_classes
      cn(
        "bg-white shadow-md border-b border-secondary-200",
        html_options[:class]
      )
    end
  end
end
