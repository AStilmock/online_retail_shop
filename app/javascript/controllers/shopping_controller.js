import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["link", "message"];

  connect() {
    this.formatLinks();
    this.applyListStyling();
    this.applyHeaderStyling();
    this.styleHomeButton(); // Style the Home button

    if (this.hasMessageTarget) {
      this.formatMessage();
    }
  }

  formatLinks() {
    this.linkTargets.forEach((link) => {
      link.style.color = "#007BFF";  // Default link color
      link.style.textDecoration = "none";
    });
  }

  applyListStyling() {
    const lists = this.element.querySelectorAll(".list");
    lists.forEach((list) => {
      list.style.padding = "1rem";
      list.style.border = "1px solid #ddd";
      list.style.borderRadius = "5px";
      list.style.backgroundColor = "#f9f9f9";
      list.style.marginBottom = "2rem";
    });
  }

  applyHeaderStyling() {
    const headers = this.element.querySelectorAll(".list-header");
    headers.forEach((header) => {
      header.style.fontSize = "1.5rem";
      header.style.fontWeight = "bold";
      header.style.marginBottom = "1rem";
      header.style.textAlign = "left";
      header.style.color = "#333";
    });
  }

  // Method to style the Home button and its container
  styleHomeButton() {
    const homeButtonContainer = this.element.querySelector(".home-button-container");

    if (homeButtonContainer) {
      // Ensure the container is positioned below the lists and block level
      homeButtonContainer.style.textAlign = "center"; // Center the button
      homeButtonContainer.style.marginTop = "2rem";  // Space above the button
      homeButtonContainer.style.marginBottom = "3rem";  // Optional margin at the bottom

      // Styling the Home button itself
      const homeButton = homeButtonContainer.querySelector(".home-button");

      if (homeButton) {
        homeButton.style.display = "inline-block"; // Make sure it's block level
        homeButton.style.padding = "1rem 2rem"; // Larger padding for better visibility
        homeButton.style.backgroundColor = "#007BFF";  // Blue background
        homeButton.style.color = "white";  // White text
        homeButton.style.textDecoration = "none";  // Remove underline
        homeButton.style.fontSize = "1.2rem";
        homeButton.style.fontWeight = "bold";
        homeButton.style.borderRadius = "4px";

        // Hover effect for the button
        homeButton.addEventListener("mouseenter", () => {
          homeButton.style.backgroundColor = "#0056b3";  // Darker blue on hover
        });
        homeButton.addEventListener("mouseleave", () => {
          homeButton.style.backgroundColor = "#007BFF";  // Reset color on mouse out
        });
      }
    }
  }

  formatMessage() {
    this.messageTarget.innerHTML = `
      <h3 class="text-4xl font-bold text-center text-blue-600">
        Here be the shopping page - view our inventory selection below!
      </h3>
    `;
  }
}
