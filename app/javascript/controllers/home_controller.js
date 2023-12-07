import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="home"
export default class extends Controller {

  connect() {
    if (!localStorage.getItem('visited')) {
      this.element.classList.remove('d-none');
      setTimeout(() => {
        this.element.classList.add('disappear');
      }, 1500)
      localStorage.setItem('visited', 'true');
      setTimeout(() => {
        this.element.classList.add('d-none');
      }, 3500)

    }
  }
}
