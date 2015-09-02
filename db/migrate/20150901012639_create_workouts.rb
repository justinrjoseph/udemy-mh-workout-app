class CreateWorkouts < ActiveRecord::Migration
  def change
    create_table :workouts do |t|
      t.integer :duration_in_mins
      t.text :description
      t.date :date
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
