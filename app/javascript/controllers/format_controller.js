import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["link", "message", "form", "input"];

  connect() {
    // Set default link color for all link targets
    this.linkTargets.forEach((link) => {
      link.style.color = "blue"; // Set the default color to blue

      // Add event listeners for hover effect
      link.addEventListener("mouseenter", () => {
        link.style.color = "#3b82f6"; // Change color to a hover blue
      });

      link.addEventListener("mouseleave", () => {
        link.style.color = "blue"; // Revert to the default blue color
      });
    });

    // Apply alignment and style the form if the form target exists
    if (this.hasFormTarget) {
      this.alignForm();
    }
  }

  formatMessage() {
    // Update the content and styles of the message target
    this.messageTarget.innerHTML = `
      <h1 class="text-4xl font-bold text-center text-blue-600">
        WELCOME TO THE TEST ONLINE RETAIL STORE!
      </h1>
      <p class="text-base text-gray-600 text-center">
        All sales are final. And all merchandise is fake.
      </p>
    `;
  }

  alignForm() {
    // Apply consistent alignment styling to form fields and buttons
    if (this.hasFormTarget) {
      this.formTarget.style.display = "flex";
      this.formTarget.style.flexDirection = "column";
      this.formTarget.style.alignItems = "flex-start";  // Align to the left
      this.formTarget.style.maxWidth = "500px";  // Set max-width for better layout
      this.formTarget.style.margin = "0 auto"; // Center the form
    }

    // Apply specific styling to the input fields
    this.formTarget.querySelectorAll(".field").forEach((field) => {
      field.style.marginBottom = "1rem";
      field.style.display = "flex";
      field.style.flexDirection = "column";
      field.style.alignItems = "flex-start";  // Ensure fields are aligned left
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
