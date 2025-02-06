import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["link", "message"];

  connect() {
    this.linkTargets.forEach((link) => {
      link.style.color = "blue";  // Default color for links
    });
  }
}
