import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ "source", "tooltip" ]

  copy() {
    navigator.clipboard.writeText(this.sourceTarget.value)
    this.tooltipTarget.classList.add("tooltip-open")
  }

}
