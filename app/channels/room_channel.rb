class RoomChannel < ApplicationCable::Channel
  def subscribed
    stream_from "room_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def speak(data)
    message = Message.new(content: data["message"], user_id: current_user.id, room_id: data["room_id"])
    message.save
    user = current_user
    user_image = user.user_image
    ActionCable.server.broadcast "room_channel", user_id: current_user.id, content: data["message"], receive_user_id: data["receive_user_id"] ,user_image: user_image
  end
end
