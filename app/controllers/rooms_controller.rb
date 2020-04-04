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
    @room_id = params[:id].to_i
    @messages = room.messages
    if room.host_id == current_user.id
      @receive_user_id = room.member_id
    else
      @receive_user_id = room.host_id
    end

    @sent_user_id = current_user.id
    # if room.member_id == current_user.id
    #   @receive_user_id = room.host_id
    # else
    #   @receive_user_id = room.member_id
    # end
  end

  def index
    @per = 8.to_i
    @rooms_all = Room.where("(host_id = ?) OR (member_id = ?)", current_user,current_user)
    @rooms = @rooms_all.page(params[:page]).per(@per)
  end

end