# frozen_string_literal: true

module Ui
  class RadioComponent < Ui::BaseComponent
    def initialize(
      name:,
      value:,
      id: nil,
      label: nil,
      checked: false,
      disabled: false,
      error: nil,
      **html_options
    )
      @name = name
      @value = value
      @id = id || "#{name.to_s.parameterize}_#{value.to_s.parameterize}"
      @label = label
      @checked = checked
      @disabled = disabled
      @error = error
      @html_options = html_options
    end

    def radio_id
      @id
    end

    def error?
      error.present?
    end

    private

    attr_reader :name, :value, :label, :checked, :disabled, :error, :html_options
  end
end
