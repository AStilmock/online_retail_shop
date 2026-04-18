# frozen_string_literal: true

module Ui
  class AlertComponentPreview < ViewComponent::Preview
    def notice
      render Ui::AlertComponent.new(message: "Saved successfully.", variant: :notice)
    end

    def alert
      render Ui::AlertComponent.new(message: "Something went wrong.", variant: :alert)
    end

    def dismissible
      render Ui::AlertComponent.new(message: "You can close this banner.", variant: :info, dismissible: true)
    end
  end
end
