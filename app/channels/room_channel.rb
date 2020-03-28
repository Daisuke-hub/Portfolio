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
    ActionCable.server.broadcast "room_channel", data["message"]
  end
end
