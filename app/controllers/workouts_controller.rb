class WorkoutsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_workout, except: [:index, :new, :create]
  
  def index
    @workouts = current_user.workouts
  end
  
  def show
    
  end
  
  def new
    @workout = current_user.workouts.new
  end
  
  def create
    @workout = current_user.workouts.build(workout_params)
    
    if @workout.save
      flash[:success] = "Workout has been created"
      redirect_to [current_user, @workout]
    else
      flash.now[:danger] = "Workout was not created"
      render :new
    end
  end
  
  def edit
    @workout = current_user.workouts.find(params[:id])
  end
  
  def update    
    if @workout.update(workout_params)
      flash[:success] = "Workout was updated"
      redirect_to [current_user, @workout]
    else
      flash.now[:danger] = "Workout update failed"
      render :edit
    end
  end
  
  private
  
    def workout_params
      params.require(:workout).permit(:duration, :details, :date, :user_id)
    end
  
    def set_workout
      @workout = current_user.workouts.find(params[:id])
    end
  
end
