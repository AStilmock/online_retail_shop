# frozen_string_literal: true

module Ui
  class BreadcrumbsComponent < Ui::BaseComponent
    # items: array of { label:, url: } — last item may omit url for current page
    def initialize(items:, **html_options)
      @items = items
      @html_options = html_options
    end

    private

    attr_reader :items, :html_options

    def nav_classes
      cn(
        "flex flex-wrap items-center gap-2 text-sm text-secondary-600",
        html_options[:class]
      )
    end
  end
end
