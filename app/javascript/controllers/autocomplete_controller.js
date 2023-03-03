import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="autocomplete"
export default class extends Controller {

  static targets = [ 'phoneNumber', 'name' ]

  lookupNumber() {
    let phone_number = this.phoneNumberTarget.value
    let fetchUrl = "/autocomplete?phone_number=" + phone_number
    let name = null

    fetch(fetchUrl).then (response => {
      response.text().then (text => {
        name = JSON.parse(text).name
        this.nameTarget.value = name
      }).catch(this.nameTarget.value = "")
    }).catch(this.nameTarget.value = "")

  }
}
