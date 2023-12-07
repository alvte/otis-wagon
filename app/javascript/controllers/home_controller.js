import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="home"
export default class extends Controller {

  connect() {

    if (!sessionStorage.getItem('visited')) {
      this.element.classList.remove('d-none');
      setTimeout(() => {
        this.element.classList.add('disappear');
      }, 2500)
      sessionStorage.setItem('visited', 'true');
      setTimeout(() => {
        this.element.classList.add('d-none');
      }, 5500)
    }
  }
}
