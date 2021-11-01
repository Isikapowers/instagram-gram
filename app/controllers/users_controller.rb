class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:edit, :update]

  def index
  end

  def show
    @user = current_user
    @posts = @user.posts.order(created_at: :desc)
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    current_user.update(user_params)
    redirect_to current_user
  end

  def destroy
    current_user.destroy(params[:id])

    redirect_to new_user_session_path
  end

  private

  def user_params
    params.require(:user).permit(:username, :name, :website,
                                 :bio, :email, :phone, :gender, :avatar)
  end
end
