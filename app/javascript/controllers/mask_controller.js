import { Controller } from "@hotwired/stimulus"
import IMask from "imask"

// Connects to data-controller="mask"
export default class extends Controller {

  static targets = [ 'phoneNumber' ]

  connect() {
    IMask(
      this.phoneNumberTarget, {
        mask: '000-000-0000'
      }
    )
  }
}
