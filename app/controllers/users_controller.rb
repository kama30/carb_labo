class UsersController < ApplicationController
  before_action :require_user_logged_in, only: [:show, :edit, :update]
  before_action :set_user, only: [:show, :edit, :update]
  before_action :correct_user, only: [:show, :edit, :update]
  
  def show
    @diets = Diet.all
  end
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = 'ユーザを登録しました。'
      redirect_to @user
    else
      flash.now[:danger] = 'ユーザの登録に失敗しました。'
      render :new
    end
  end
  
  def edit
  end
  
  def update
    if @user.update(user_params)
      flash[:success] = '目標を設定しました。'
      redirect_to @user
    else
      flash.now[:danger] = '目標の設定に失敗しました'
      render :edit
    end
  end
  
  def weekly_records
    @weekly_records = Diet.where(user_id: current_user.id, start_time: Date.today.prev_week...Date.tomorrow)
  end
  
  def monthly_records
    @monthly_records = Diet.where(user_id: current_user.id, start_time: Date.today.last_month...Date.tomorrow)
  end
  
  def yearly_records
    @yearly_records = Diet.where(user_id: current_user.id, start_time: Date.today.last_year...Date.tomorrow)
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
