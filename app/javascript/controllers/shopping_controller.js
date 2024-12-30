import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["link", "message"];

  connect() {
    // Style links dynamically
    this.linkTargets.forEach((link) => {
      link.style.color = "blue"; // Default color for links
    });

    if (this.hasMessageTarget) {
      this.formatMessage();
    }
  }

  formatMessage() {
    // Fixing the typo in `messageTarget`
    this.messageTarget.innerHTML = `
      <h3 class="text-4xl font-bold text-center text-blue-600">Here be the shopping page - 
      view our inventory selection below!</h3>
    `;
  }
}
