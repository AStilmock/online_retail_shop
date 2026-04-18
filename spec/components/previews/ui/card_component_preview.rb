# frozen_string_literal: true

module Ui
  class CardComponentPreview < ViewComponent::Preview
    def default
      render Ui::CardComponent.new(title: "Card title") do
        tag.p("Card body content goes here.", class: "text-secondary-700")
      end
    end

    def with_header_slot
      render Ui::CardComponent.new do |card|
        card.with_header do
          tag.span("Custom header slot", class: "text-sm font-medium text-secondary-600")
        end
        tag.p("Body under a custom header.", class: "text-secondary-700")
      end
    end
  end
end
