# frozen_string_literal: true

module Ui
  class TextareaComponent < Ui::BaseComponent
    def initialize(
      name:,
      id: nil,
      label: nil,
      value: nil,
      rows: 4,
      placeholder: nil,
      required: false,
      disabled: false,
      error: nil,
      hint: nil,
      **html_options
    )
      @name = name
      @id = id || name.to_s.tr("[", "_").tr("]", "").gsub("]", "")
      @label = label
      @value = value
      @rows = rows
      @placeholder = placeholder
      @required = required
      @disabled = disabled
      @error = error
      @hint = hint
      @html_options = html_options
    end

    def area_id
      @id
    end

    def error?
      error.present?
    end

    private

    attr_reader :name, :label, :value, :rows, :placeholder, :required, :disabled, :error, :hint, :html_options

    def area_classes
      cn(
        error? && "border-danger-500 focus:border-danger-500 focus:ring-danger-500/30",
        html_options[:class]
      )
    end
  end
end
