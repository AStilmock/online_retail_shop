# frozen_string_literal: true

module Ui
  class InputComponentPreview < ViewComponent::Preview
    def email
      render Ui::InputComponent.new(
        name: "preview_email",
        type: "email",
        label: "Email",
        placeholder: "you@example.com",
        hint: "We will never share your email."
      )
    end

    def with_error
      render Ui::InputComponent.new(
        name: "preview_field",
        label: "Field",
        error: "This field is required."
      )
    end
  end
end
