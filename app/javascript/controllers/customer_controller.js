import { Controller } from "@hotwired/stimulus"

export default class extends Controller {

  connect() {
    this.element.firstElementChild.classList.add("collapse-open")
  }

}
