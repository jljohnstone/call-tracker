import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="turbo-modal"
export default class extends Controller {

  hide() {
    this.element.parentElement.removeAttribute("src")
    this.element.remove()
  }

}
