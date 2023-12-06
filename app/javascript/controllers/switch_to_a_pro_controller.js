import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="switch-to-a-pro"
function getCSRFToken() {
  const tokenTag = document.querySelector("meta[name=csrf-token]");
  return tokenTag ? tokenTag.content : null;
}

// Your controller code
export default class extends Controller {
  static targets = ["toggle"];

  switch(event) {
    const csrfToken = getCSRFToken();

    fetch(`/chatrooms/${this.toggleTarget.id}/deactivate_chat_GPT`, {
      method: "PATCH",
      headers: {
        "Accept": "application/json",
        "Content-Type": "application/json",
        "X-CSRF-Token": csrfToken // Include the CSRF token in the headers
      }
    });
    this.toggleTarget.checked = false;
    document.getElementById("toggletext").innerText = "You are chating with a pro";
    document.querySelector(".interlocutor-indicator").innerText = "You are talking with a professional 👩‍⚕️"
    document.querySelector(".chatroom").style.background = "radial-gradient(45% 35% at 35% 35%, #FFAFC8 0%, #FFF 100%)";
  }
}
