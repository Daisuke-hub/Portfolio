class RoomsController < ApplicationController
  def create
    check_host = Room.where(host_id: current_user.id, member_id: params[:id]).exists?
    check_member = Room.where(host_id: params[:id], member_id: current_user.id).exists?
    if check_host || check_member == true
      if Room.where(host_id: current_user.id, member_id: params[:id]).exists? == false
        room = Room.where(host_id: params[:id], member_id: current_user.id).first
      else
        room = Room.where(host_id: current_user.id, member_id: params[:id]).first
      end
    else
      room = Room.new(host_id: current_user.id, member_id: params[:id])
      room.save     
    end
    redirect_to room_path(room)
  end

  def show
    room = Room.find(params[:id])
    # messages = room.messages
    # @sent_messages = messages.where(user_id: current_user)
    # @receive_messages = messages.where.not(user_id: current_user)
    # receive_message = messages.where.not(user_id: current_user).first
    # @receive_user = receive_message.user
    @room_id = params[:id].to_i
    @messages = room.messages
  end
end