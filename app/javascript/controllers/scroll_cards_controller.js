import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["card", "innerContainer"];
  static values = { counter: Number };

  get lastCard() {
    return this.cardTargets[this.cardTargets.length - 1]
  }

  connect() {
    this.cardTargets.forEach(card => {
      const position = card.dataset.scrollCardsValue * 250;
      card.style.bottom = `${position}px`;
    });
    this.innerContainerTarget.style.height = `${this.lastCard.offsetTop + this.lastCard.offsetHeight}px`
    }

  push_down(event) {
    const cardIndex = event.target.parentElement.parentElement.dataset.scrollCardsValue;
    const isPushedDown = event.target.classList.contains('pushed-down');

    this.cardTargets.forEach(card => {
      const otherCardIndex = card.dataset.scrollCardsValue;

      if (cardIndex < otherCardIndex && !isPushedDown) {
        const position = (Number(otherCardIndex) * 250) - 250;
        card.style.bottom = `${position}px`;
        event.target.parentElement.parentElement.classList.add('pushed-down');
        this.innerContainerTarget.style.height = `${this.lastCard.offsetTop + this.lastCard.offsetHeight}px`
      } else if (cardIndex < otherCardIndex && isPushedDown) {
        const position = Number(otherCardIndex) * 250;
        card.style.bottom = `${position}px`;
        event.target.parentElement.parentElement.classList.remove('pushed-down');
        this.innerContainerTarget.style.height = `${this.lastCard.offsetTop + this.lastCard.offsetHeight}px`
      }
    });

    event.target.classList.toggle('pushed-down');
  }
}
