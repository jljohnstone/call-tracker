import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="turbo-modal"
export default class extends Controller {

  // static mainElement

  connect() {
    // this.mainElement = document.getElementsByTagName("main")[0]
    // this.mainElement.classList.add("blur-sm")
  }

  hide() {
    // this.mainElement.classList.remove("blur-sm")
    this.element.parentElement.removeAttribute("src")
    this.element.remove()
  }

}
