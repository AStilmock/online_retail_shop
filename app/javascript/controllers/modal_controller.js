import { Controller } from "@hotwired/stimulus"

// Toggle modal panel + backdrop. Targets: panel, backdrop (optional)
export default class extends Controller {
  static targets = ["panel", "backdrop"]

  connect() {
    this._onKeydown = this._onKeydown.bind(this)
  }

  disconnect() {
    document.removeEventListener("keydown", this._onKeydown)
  }

  open() {
    this.panelTarget.classList.remove("hidden")
    if (this.hasBackdropTarget) this.backdropTarget.classList.remove("hidden")
    document.body.classList.add("overflow-hidden")
    document.addEventListener("keydown", this._onKeydown)
  }

  close() {
    this.panelTarget.classList.add("hidden")
    if (this.hasBackdropTarget) this.backdropTarget.classList.add("hidden")
    document.body.classList.remove("overflow-hidden")
    document.removeEventListener("keydown", this._onKeydown)
  }

  _onKeydown(event) {
    if (event.key === "Escape") this.close()
  }
}
