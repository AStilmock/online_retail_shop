# frozen_string_literal: true

module Ui
  class ModalComponent < Ui::BaseComponent
    renders_one :trigger

    def initialize(title:, modal_id: nil, **html_options)
      @title = title
      @modal_id = modal_id || "modal-#{object_id}"
      @html_options = html_options
    end

    private

    attr_reader :title, :modal_id, :html_options
  end
end
