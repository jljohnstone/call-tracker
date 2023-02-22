import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ "number", "name" ]

  setName() {
    const numberElement = this.numberTarget
    const nameElement = this.nameTarget

    // find the number in the datalist
    var option = Array.prototype.find.call(numberElement.list.options, function(option) {
      return option.value === numberElement.value
    })

    // set the name for the number
    nameElement.value = option.text
  }

  clearFields() {
    this.numberTarget.value = ""
    this.nameTarget.value = ""
  }

}
