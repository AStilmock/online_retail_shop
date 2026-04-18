# frozen_string_literal: true

module Ui
  class InputComponent < Ui::BaseComponent
    def initialize(
      name:,
      id: nil,
      type: "text",
      label: nil,
      value: nil,
      placeholder: nil,
      required: false,
      disabled: false,
      error: nil,
      hint: nil,
      field_data: {},
      **html_options
    )
      @name = name
      @id = id || name.to_s.tr("[", "_").tr("]", "").gsub("]", "")
      @type = type
      @label = label
      @value = value
      @placeholder = placeholder
      @required = required
      @disabled = disabled
      @error = error
      @hint = hint
      @field_data = field_data
      @html_options = html_options
    end

    def input_id
      @id
    end

    def error?
      error.present?
    end

    private

    attr_reader :name, :type, :label, :value, :placeholder, :required, :disabled, :error, :hint, :field_data, :html_options

    def input_classes
      cn(
        error? && "border-danger-500 focus:border-danger-500 focus:ring-danger-500/30",
        html_options[:class]
      )
    end
  end
end
