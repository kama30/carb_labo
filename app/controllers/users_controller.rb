class UsersController < ApplicationController
  before_action :require_user_logged_in, only: [:show, :edit, :update]
  before_action :set_user, only: [:show, :edit, :update]
  before_action :correct_user, only: [:show, :edit, :update]
  
  def show
  end
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = 'ユーザを登録しました。'
      redirect_to @user
    else
      flash.now[:notice] = 'ユーザの登録に失敗しました。'
      render :new
    end
  end
  
  def edit
  end
  
  def update
    if @user.update(user_params)
      flash[:notice] = '目標を設定しました。'
      redirect_to @user
    else
      flash.now[:notice] = '目標の設定に失敗しました'
      render :edit
    end
  end
  
  private
  
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_digest, :goal)
  end
  
  def set_user
    @user = User.find(params[:id])
  end
  
  def correct_user
    unless @user == current_user
      redirect_back(fallback_location: root_path)
    end
  end
end
