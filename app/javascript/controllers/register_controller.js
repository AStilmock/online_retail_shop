import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["form", "input", "link"];

  connect() {
    this.alignForm();
    this.styleBackLink();
  }

  alignForm() {
    if (this.hasFormTarget) {
      this.formTarget.querySelectorAll(".field").forEach((field) => {
        field.classList.add("field");
      });

      const submitButton = this.formTarget.querySelector(".actions input[type='submit']");
      if (submitButton) {
        submitButton.classList.add("submit-button");
      }
    }
  }

  styleBackLink() {
    if (this.hasLinkTarget) {
      const backLink = this.linkTarget;
      backLink.classList.add("back-link");
    }
  }
}