class ChangeWorkoutDurationInMinsToDuration < ActiveRecord::Migration
  def change
    rename_column :workouts, :duration_in_mins, :duration
  end
end
