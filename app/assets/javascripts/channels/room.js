App.room = App.cable.subscriptions.create("RoomChannel", {
  connected: function() {
    console.log("connected")
    // Called when the subscription is ready for use on the server
  },

  disconnected: function() {
    // Called when the subscription has been terminated by the server
  },

  received: function(data) {
    // location.reload();
    console.log("received");
    console.log(data);
    console.log(data["content"]);
    $('#sc').render(data).appendTo("#br")
    // $('<li>',{
    //   id: "balloon",
    //   text: data["content"],
    // }).appendTo("#message");
    // Called when there's incoming data on the websocket for this channel
  },

  speak: function(content, room_id) {
    return this.perform('speak', {message: content, room_id: room_id});
  }
});

$(function(){
  $(".button").on("click",function(){
    var content = $(".chat-input").val();
    var room_id = $("#room_id").val();
    App.room.speak(content, room_id);
    $(".chat-input").val("")
  });
});