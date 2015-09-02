class Workout < ActiveRecord::Base
  belongs_to :user
  
  validates :duration, presence: true
  validates :duration, numericality: { only_integer: true }
  validates :details, presence: true
  validates :date, presence: true
  validates :user_id, presence: true
end
