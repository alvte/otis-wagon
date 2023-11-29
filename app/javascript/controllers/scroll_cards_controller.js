import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["card"];
  static values = { counter: Number };

  connect() {
    this.cardTargets.forEach(element => {
      const position = element.dataset.scrollCardsValue * 250;
      element.style.bottom = `${position}px`;
    });
    }

  push_down(event) {
    console.log(element.dataset.scrollCardsValue);
    this.parentElement
  }
  }
