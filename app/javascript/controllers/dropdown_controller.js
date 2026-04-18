import { Controller } from "@hotwired/stimulus"

// Targets: menu, button (optional — click outside closes)
export default class extends Controller {
  static targets = ["menu", "button"]

  connect() {
    this._onDocumentClick = this._onDocumentClick.bind(this)
  }

  toggle(event) {
    event?.stopPropagation()
    this.menuTarget.classList.toggle("hidden")
    if (!this.menuTarget.classList.contains("hidden")) {
      setTimeout(() => document.addEventListener("click", this._onDocumentClick), 0)
    } else {
      document.removeEventListener("click", this._onDocumentClick)
    }
  }

  close() {
    this.menuTarget.classList.add("hidden")
    document.removeEventListener("click", this._onDocumentClick)
  }

  _onDocumentClick(event) {
    if (this.element.contains(event.target)) return
    this.close()
  }
}
