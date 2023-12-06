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
    this.toggleTarget.checked = true;
    document.getElementById("toggletext").innerText = "You are chating with a pro";
  }
}
