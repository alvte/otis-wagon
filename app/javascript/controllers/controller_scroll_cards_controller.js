import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="controller-scroll-cards"
export default class extends Controller {
  connect() {
    console.log("Hello world")
  }
}
