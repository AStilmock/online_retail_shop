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
    this.messageTarget.innerHTML = `
      <h1 class="text-4xl font-bold text-center text-blue-600">
        WELCOME TO THE TEST ONLINE RETAIL STORE!
      </h1>
      <p class="text-base text-gray-600 text-center">
        All sales are final. And all merchandise is fake.
      </p>
    `;
  }
}
