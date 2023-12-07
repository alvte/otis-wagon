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
    this.heightValue = `${this.lastCard.offsetTop + this.lastCard.offsetHeight + 85}px`
    this.innerContainerTarget.style.height = this.heightValue;
  }

  push_down(event) {
    if (event.target.parentElement.parentElement.classList.contains('pushed-down')) {
      this.fold_card()
    } else {
      this.fold_card()
      this.open_card(event)
    }
  }

  open_card(event) {
    const cardIndex = event.target.parentElement.parentElement.dataset.scrollCardsValue;
    this.cardTargets.forEach(card => {
      const otherCardIndex = card.dataset.scrollCardsValue;
      if (cardIndex < otherCardIndex) {
        const position = (Number(otherCardIndex) * 250) - 250;
        card.style.bottom = `${position}px`;
        event.target.parentElement.parentElement.classList.add('pushed-down');
        this.innerContainerTarget.style.height = `${this.lastCard.offsetTop + this.lastCard.offsetHeight + 310}px`
      }
    })
  }

  fold_card() {
    this.cardTargets.forEach(card => {
      const otherCardIndex = card.dataset.scrollCardsValue;
      const position = Number(otherCardIndex) * 250;
      card.style.bottom = `${position}px`;
      console.log
      if (card.classList.contains('pushed-down')) {
        card.classList.remove('pushed-down')
      }
      this.innerContainerTarget.style.height = this.heightValue + 50
    })
  }
}
