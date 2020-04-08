App.room = App.cable.subscriptions.create("RoomChannel", {
  // received_user: function() {
  //   var received_user = $("#user_id").val();
  //   console.log("received_user");
  //   console.log(received_user);
  //   return received_user;
  // },

  notification: function(message){
    var title = 'SESSIONから新規のメッセージがあります';
    var n = new Notification(
      title,
      {
        body: message,
        tag: 'SESSION_message',
      }
    );
  },

  connected: function() {
    // Called when the subscription is ready for use on the server
  },

  disconnected: function() {
    // Called when the subscription has been terminated by the server
  },

  received: function(data) {
    var current_user_id = $("#current_user_id").val();
    if (current_user_id == data["user_id"]){
      $('<li>',{
        id: "message_id_" + data["message_id"],
        class: "right",
      }).appendTo("#add");
      $('<span>',{
        class: "created_time",
        text: data["created_time"],
      }).appendTo("#message_id_" + data["message_id"]);
      $('<span>',{
        id: "receive_balloon_right",
        text: data["content"],
      }).appendTo("#message_id_" + data["message_id"]);
      
    } else if (current_user_id == data["receive_user_id"]){
      $('<li>',{
        id: "message_id_" + data["message_id"],
        class: "left",
      }).appendTo("#add");
      $("#message_id_" + data["message_id"]).append('<img src="' + data["user_image"] + '"id=message_image >' );
      $('<span>',{
        id: "receive_balloon",
        text: data["content"],
      }).appendTo("#message_id_" + data["message_id"]);
      $('<span>',{
        class: "created_time",
        text: data["created_time"],
      }).appendTo("#message_id_" + data["message_id"]);
    };

    if (current_user_id == data["receive_user_id"]){
      var message = data["content"];
      App.room.notification(message);
    } else if (current_user_id == data["user_id"]) {
      $('input').focus();
      $('#page_top').on('click',function(){
        $('body, html').animate({
        scrollBottom:0
        }, 800);
        return false;
      });
    };
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