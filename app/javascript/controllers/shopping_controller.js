import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["link", "message"];

  connect() {
    this.linkTargets.forEach((link) => {
      link.style.color = "blue";  // Default color for links
    });

    if (this.hasMessageTarget) {
      this.formatMessage();
    }
  }

  formatMessage() {
    this.messageTaget.innerHTML = `
      <h3 class="text-4xl font-bold text-center text-blue-600"> Here be the shopping page - 
      view our inventory selection below! </h3>
    `;
  }
}