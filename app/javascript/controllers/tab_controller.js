import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="tab"
export default class extends Controller {

  static targets = [ 'incompleteTab', 'completeTab', 'incompleteNotes', 'completeNotes' ]

  connect() {
    this.showIncomplete()
  }

  showComplete() {
    this.completeTabTarget.classList.add('tab-active')
    this.completeNotesTarget.classList.add('block')
    this.completeNotesTarget.classList.remove('hidden')
    this.incompleteTabTarget.classList.remove('tab-active')
    this.incompleteNotesTarget.classList.remove('block')
    this.incompleteNotesTarget.classList.add('hidden')
  }

  showIncomplete() {
    this.incompleteTabTarget.classList.add('tab-active')
    this.incompleteNotesTarget.classList.add('block')
    this.incompleteNotesTarget.classList.remove('hidden')
    this.completeTabTarget.classList.remove('tab-active')
    this.completeNotesTarget.classList.remove('block')
    this.completeNotesTarget.classList.add('hidden')
  }
}
