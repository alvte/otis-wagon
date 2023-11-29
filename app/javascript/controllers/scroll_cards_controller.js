import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["card"];
  static values = { counter: Number };

  connect() {
    this.cardTargets.forEach(card => {
      const position = card.dataset.scrollCardsValue * 250;
      card.style.bottom = `${position}px`;
    });
    }

  push_down(event) {
    const cardIndex = event.target.parentElement.parentElement.dataset.scrollCardsValue;
    const isPushedDown = event.target.classList.contains('pushed-down');

    this.cardTargets.forEach(card => {
      const otherCardIndex = card.dataset.scrollCardsValue;

      if (cardIndex < otherCardIndex && !isPushedDown) {
        const position = (Number(otherCardIndex) * 250) - 250;
        card.style.bottom = `${position}px`;
        card.classList.add('pushed-down');
      } else if (cardIndex < otherCardIndex && isPushedDown) {
        const position = Number(otherCardIndex) * 250;
        card.style.bottom = `${position}px`;
        card.classList.remove('pushed-down');
      }
    });

    event.target.classList.toggle('pushed-down');
  }
}
