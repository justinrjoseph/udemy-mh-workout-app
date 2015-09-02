class WorkoutsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_workout, except: [:index, :new, :create]
  
  def index
    
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
      flash[:danger] = "Workout was not created"
      render :new
    end
  end
  
  private
  
    def workout_params
      params.require(:workout).permit(:duration_in_mins, :description, :date,
                                      :user_id)
    end
  
    def set_workout
      @workout = current_user.workouts.find(params[:id])
    end
  
end
