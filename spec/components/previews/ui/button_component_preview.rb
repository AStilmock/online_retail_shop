# frozen_string_literal: true

module Ui
  class ButtonComponentPreview < ViewComponent::Preview
    def primary
      render Ui::ButtonComponent.new(label: "Primary action", variant: :primary)
    end

    def outline
      render Ui::ButtonComponent.new(label: "Outline", variant: :outline)
    end

    def danger
      render Ui::ButtonComponent.new(label: "Delete", variant: :danger)
    end
  end
end
