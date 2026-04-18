# frozen_string_literal: true

module Ui
  class TableComponent < Ui::BaseComponent
    def initialize(headers:, striped: true, **html_options)
      @headers = headers
      @striped = striped
      @html_options = html_options
    end

    private

    attr_reader :headers, :striped, :html_options

    def wrapper_classes
      cn(
        "overflow-x-auto rounded-lg border border-secondary-200 shadow-sm",
        html_options[:class]
      )
    end

    def row_classes
      striped ? "divide-y divide-secondary-100 bg-white" : "bg-white"
    end
  end
end
