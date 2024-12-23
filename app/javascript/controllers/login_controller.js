import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["form", "input", "backLink"];  // Add backLink target for the "Back" link

  connect() {
    console.log("Login controller connected!");
    this.alignForm();
    this.styleBackLink();  // Style the "Back" link
  }

  alignForm() {
    if (this.hasFormTarget) {
      // Align the form left and set width
      this.formTarget.style.display = "flex";
      this.formTarget.style.flexDirection = "column";
      this.formTarget.style.alignItems = "flex-start"; // Align form elements to the left
      this.formTarget.style.maxWidth = "500px";  // Optional max-width
      this.formTarget.style.margin = "0"; // Remove centering
      this.formTarget.style.margin = "20px"; // Add space from the header

      // Ensure all form fields are aligned to the left
      this.formTarget.querySelectorAll(".field").forEach((field) => {
        field.style.marginBottom = "1rem"; // Add space between fields
        field.style.display = "flex";
        field.style.flexDirection = "column";
        field.style.alignItems = "flex-start";  // Align labels and inputs to the left
      });

      // Style submit button
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

  styleBackLink() {
    // Check if the backLink target exists and apply styles
    if (this.hasBackLinkTarget) {
      const backLink = this.backLinkTarget;
      backLink.style.color = "#3182ce";  // Apply blue color
      backLink.style.textDecoration = "none";  // Remove underline

      // Optionally add hover styles
      backLink.addEventListener("mouseover", () => {
        backLink.style.color = "#2b6cb0";  // Darker blue on hover
      });

      backLink.addEventListener("mouseout", () => {
        backLink.style.color = "#3182ce";  // Reset color on mouse out
      });
    }
  }
}
