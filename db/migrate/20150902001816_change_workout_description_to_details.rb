class ChangeWorkoutDescriptionToDetails < ActiveRecord::Migration
  def change
    rename_column :workouts, :description, :details
  end
end
