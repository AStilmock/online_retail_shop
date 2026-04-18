# frozen_string_literal: true

module Ui
  class BaseComponent < ViewComponent::Base
    private

    def cn(*classes)
      classes.flatten.compact_blank.join(" ")
    end
  end
end
