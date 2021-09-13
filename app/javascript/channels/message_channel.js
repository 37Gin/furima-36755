import consumer from "./consumer"

consumer.subscriptions.create("MessageChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    const nickname = `<p>${data.nickname}</p>`;
    const messageNickname = document.createElement("div");
    messageNickname.className = 'message-user-nickname';
    messageNickname.innerHTML = nickname;

    const html = `<p>${data.content.text}</p>`;
    const messageText = document.createElement("div");
    messageText.className = 'message-text';
    messageText.innerHTML = html;

    const messageContent = document.getElementById('message-content');
    messageContent.appendChild(messageNickname);
    messageContent.appendChild(messageText);

  }
});
