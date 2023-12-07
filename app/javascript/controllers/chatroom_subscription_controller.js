import { Controller } from "@hotwired/stimulus"
import { createConsumer } from "@rails/actioncable"

export default class extends Controller {
  static values = { chatroomId: Number, chatWithPro: Boolean }
  static targets = ["messages", "loaderMessage", "message"]

  connect() {
    console.log(this.chatWithProValue)
    this.channel = createConsumer().subscriptions.create(
      { channel: "ChatroomChannel", id: this.chatroomIdValue },
      { received: data => this.#insertMessageAndScrollDown(data) }
    )

  }

  resetForm(event) {
    event.target.reset()
  }

  disconnect() {
    console.log("Unsubscribed from the chatroom")
    this.channel.unsubscribe()
  }

  #insertMessageAndScrollDown(data) {
    if (this.hasLoaderMessageTarget) this.loaderMessageTarget.remove();
    this.messagesTarget.insertAdjacentHTML("beforeend", data);
    this.messagesTarget.scrollTo(0, this.messagesTarget.scrollHeight);
    const lastMessage = this.messageTargets[this.messageTargets.length - 1];
    console.log(lastMessage.dataset.author)
    if (lastMessage.dataset.author != "otisbot") this.#insertLoaderMessageAndScrollDown();
  }

  #insertLoaderMessageAndScrollDown() {
    if (this.chatWithProValue) return;
    
    this.messagesTarget.insertAdjacentHTML("beforeend", this.#loadermessageHtml());
    this.messagesTarget.scrollTo(0, this.messagesTarget.scrollHeight);
  }

  #insertGPTAndScrollDown() {
    this.messagesTarget.insertAdjacentHTML("beforeend", data)
    this.messagesTarget.scrollTo(0, this.messagesTarget.scrollHeight)
  }

  #loadermessageHtml() {
    return `
      <div class="answer-message" data-chatroom-subscription-target="loaderMessage">
        <div class="d-flex">
          <div class="separator-others">
            <small>
              <strong>Otisbot</strong>
              <i></i>
            </small>
          </div>
          <div class= "separator text-test">
            <p>&nbsp</p>
          </div>
        </div>
        <p>
          <div class="spinner-grow spinner-grow-sm" role="status">
            <span class="sr-only">Loading...</span>
          </div>
          <div class="spinner-grow spinner-grow-sm" role="status">
            <span class="sr-only">Loading...</span>
          </div>
          <div class="spinner-grow spinner-grow-sm" role="status">
            <span class="sr-only">Loading...</span>
          </div>
        </p>
      </div>
    `;
  }

}
