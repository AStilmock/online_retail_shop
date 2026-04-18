# frozen_string_literal: true

module Ui
  class CheckboxComponent < Ui::BaseComponent
    def initialize(
      name:,
      id: nil,
      label: nil,
      checked: false,
      value: "1",
      disabled: false,
      error: nil,
      **html_options
    )
      @name = name
      @id = id || "#{name.to_s.parameterize}_#{value}"
      @label = label
      @checked = checked
      @value = value
      @disabled = disabled
      @error = error
      @html_options = html_options
    end

    def box_id
      @id
    end

    def error?
      error.present?
    end

    private

    attr_reader :name, :label, :checked, :value, :disabled, :error, :html_options
  end
end
