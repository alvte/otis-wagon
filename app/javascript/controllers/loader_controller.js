import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["spinner"];
  connect() {
    document.addEventListener('DOMContentLoaded', () => {
     console.log("QQQQQQQH");
    });
  }
}
