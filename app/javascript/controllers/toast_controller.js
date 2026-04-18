import { Controller } from "@hotwired/stimulus"

// Dismiss alerts / toast banners; optional auto-remove
export default class extends Controller {
  static values = { dismissible: { type: Boolean, default: true } }

  dismiss() {
    this.element.remove()
  }
}
