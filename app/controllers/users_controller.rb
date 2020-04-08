class UsersController < ApplicationController
  before_action :baria_user, only: [:edit, :update]

  def index
    @q = User.ransack(params[:q])
    @users_all = @q.result(distinct: true)
    @per = 20.to_i
    @users = @users_all.page(params[:page]).per(@per)
  end

  def show
    @user = User.find(params[:id])
    @rooms = Room.where("(host_id = ?) OR (member_id = ?)", current_user,current_user).order(created_at: :desc)
    user_messages = Message.with_deleted.where("(user_id = ?) OR (receiver_id = ?)", current_user, current_user)
    @user_messages = user_messages.order(created_at: :desc)
    @new_message = @user_messages.first
    @count_all = 0
    @rooms.each do |room|
      if message = room.messages.with_deleted.order(created_at: :desc).first
        if message.created_at.to_date == Date.today
          @count_all += 1
        end
      end
    end
  end

  def edit
    @user = current_user
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user), notice: "ユーザー情報が更新されました"
    else
      render "edit"
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :sex, :age, :instrument, :level, :region, :introduction, :chat_flag, :email, :user_image)
  end

  def genre_params
    params.require(:genre).permit(:genre_name)
  end

  def baria_user
    user = User.find(params[:id])
    if user != current_user
      redirect_to user_path(current_user)
    end
  end
end
