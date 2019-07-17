class DietsController < ApplicationController
  before_action :require_user_logged_in
  before_action :correct_user, only: [:show, :edit, :update, :destroy]
  before_action :set_start_time, only: [:update]
  before_action :set_date, only: [:edit]
  
  def index
    @diets = current_user.diets.order(id: :desc).page(params[:page]).per(25)
  end
  
  def show
    @special_twitter = true
  end
  
  def new
    @diet = current_user.diets.build
  end
  
  def create
    @diet = current_user.diets.build(diet_params)
    set_start_time
    if @diet.save
      flash[:success] = '食事を登録しました'
      redirect_to diet_url(@diet)
    else
      flash[:danger] = '食事の登録に失敗しました'
      render :new
    end
  end
  
  def edit
  end
  
  def update
    if @diet.update(diet_params)
      flash[:success] = '食事を編集しました'
      redirect_to diet_url(@diet)
    else
      flash[:danger] = '食事の編集に失敗しました'
      render :edit
    end
  end
  
  def destroy
    @diet.destroy
    flash[:success] = '食事を削除しました'
    redirect_to diets_url
  end
  
  def daily_index
    @special_twitter = true
    @diets = current_user.diets.where(start_time: params[:start_time]).order(id: :desc).page(params[:page]).per(25)
  end
  
  def daily_new
    @diet = current_user.diets.build(start_time: params[:start_time])
  end
  
  private
  
  def set_start_time
    if params[:date] == ""
      @diet.start_time = nil
    else
      input_str = params[:date]
      date = Date.strptime(input_str, '%Y-%m-%d')
      @diet.start_time = DateTime.new(date.year, date.month, date.day, 0, 0, 0 )
    end
  end
  
  def set_date
    @date = @diet.start_time.to_date
  end
  
  def diet_params
    params.require(:diet).permit(:name, :total_amount, :intake, :calorie, :protein, :fat, :carb)
  end
  
  def correct_user
    @diet = current_user.diets.find_by(id: params[:id])
    unless @diet
      redirect_to root_url 
    end
  end
end
