class UsersController < ApplicationController
  def index
    @per = 7.to_i
    @q = User.ransack(params[:q])
    @users_all = @q.result(distinct: true)
    @users = @users_all.page(params[:page]).per(@per)
    @rooms = Room.where("(host_id = ?) OR (member_id = ?)", current_user,current_user)
    @count = 0
    @count_all = 0
    @rooms.each do |room|
      if message = room.messages.order(created_at: :desc).first
        if message.created_at.to_date == Date.today
          @count_all += 1
        end
      end
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = current_user
  end

  def update
    user = User.find(params[:id])
    user.update(user_params)
    # genre = Genre.find(genre_params)
    # user.update(user_id: current_user.id, genre_id: genre.id)
    redirect_to user_path(current_user)
  end

  private
  def user_params
    params.require(:user).permit(:name, :sex, :age, :instrument, :level, :region, :introduction, :chat_flag, :email, :user_image)
  end

  def genre_params
    params.require(:genre).permit(:genre_name)
  end
end
