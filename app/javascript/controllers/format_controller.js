import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["link"];

  connect() {
    this.linkTargets.forEach((link) => {
      link.style.color = "blue"; // Set default link color
    });
  }
}
