App.room = App.cable.subscriptions.create("RoomChannel", {
  connected: function() {
    console.log("connected");
    // Called when the subscription is ready for use on the server
  },

  disconnected: function() {
    // Called when the subscription has been terminated by the server
  },

  received: function(data) {
    console.log("received");
    console.log(data);

    sent_user_id = '#' + data["user_id"];
    receive_user_id = '#' + data["receive_user_id"];
    console.log(data["user_image"]);
    console.log(data["user_id"]);
    user_image = data["user_image"];
    image = user_image["id"];

    $('<li>',{
      id: "balloon",
      text: data["content"],
    }).appendTo("#add");

    // Called when there's incoming data on the websocket for this channel
  },

  speak: function(content, room_id, receive_user_id) {
    return this.perform('speak', {message: content, room_id: room_id, receive_user_id: receive_user_id});
  }
});

$(function(){
  $(".button").on("click",function(){
    var content = $(".chat-input").val();
    var room_id = $("#room_id").val();
    var receive_user_id = $("#receive_user_id").val();
    App.room.speak(content, room_id, receive_user_id);
    $(".chat-input").val("")
  });
});