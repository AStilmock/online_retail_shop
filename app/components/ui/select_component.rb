# frozen_string_literal: true

module Ui
  class SelectComponent < Ui::BaseComponent
    def initialize(
      name:,
      options:,
      id: nil,
      label: nil,
      selected: nil,
      include_blank: nil,
      required: false,
      disabled: false,
      error: nil,
      hint: nil,
      **html_options
    )
      @name = name
      @options = options
      @id = id || name.to_s.tr("[", "_").tr("]", "").gsub("]", "")
      @label = label
      @selected = selected
      @include_blank = include_blank
      @required = required
      @disabled = disabled
      @error = error
      @hint = hint
      @html_options = html_options
    end

    def select_id
      @id
    end

    def error?
      error.present?
    end

    private

    attr_reader :name, :options, :label, :selected, :include_blank, :required, :disabled, :error, :hint, :html_options

    def select_classes
      cn(
        error? && "border-danger-500 focus:border-danger-500 focus:ring-danger-500/30",
        html_options[:class]
      )
    end
  end
end
