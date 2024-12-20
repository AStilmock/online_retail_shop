import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["link", "form", "input"];

  connect() {
    this.linkTargets.forEach((link) => {
      link.style.color = "blue";  // Set default color for links
    });

    if (this.hasFormTarget) {
      this.alignForm();
    }
  }

  alignForm() {
    this.formTarget.style.display = "flex";
    this.formTarget.style.flexDirection = "column";
    this.formTarget.style.alignItems = "flex-start";
    this.formTarget.style.maxWidth = "500px";  // Set max-width for better layout
    this.formTarget.style.margin = "0 auto"; // Center the form

    // Apply specific styling to form fields
    this.formTarget.querySelectorAll(".field").forEach((field) => {
      field.style.marginBottom = "1rem";
      field.style.display = "flex";
      field.style.flexDirection = "column";
      field.style.alignItems = "flex-start";
    });

    // Style the submit button
    const submitButton = this.formTarget.querySelector(".actions input[type='submit']");
    if (submitButton) {
      submitButton.style.marginTop = "1rem";
      submitButton.style.padding = "0.5rem 1rem";
      submitButton.style.backgroundColor = "#007BFF";
      submitButton.style.color = "#fff";
      submitButton.style.border = "none";
      submitButton.style.borderRadius = "4px";
      submitButton.style.cursor = "pointer";
    }
  }
}
