import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["link"]; // Define a target for links

  connect() {
    // Apply default link styles to all link targets
    this.linkTargets.forEach((link) => {
      link.style.color = "blue"; // Set the color of the links to blue
    });
  }
}
