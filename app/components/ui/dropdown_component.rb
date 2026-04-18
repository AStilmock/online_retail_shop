# frozen_string_literal: true

module Ui
  class DropdownComponent < Ui::BaseComponent
    renders_one :button

    def initialize(align: :right, **html_options)
      @align = align.to_sym
      @html_options = html_options
    end

    private

    attr_reader :align, :html_options

    def menu_classes
      cn(
        "absolute z-50 mt-2 min-w-[12rem] rounded-md border border-secondary-200 bg-white py-1 shadow-dropdown",
        align == :left ? "left-0" : "right-0"
      )
    end
  end
end
