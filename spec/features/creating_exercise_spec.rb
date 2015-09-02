require 'rails_helper'

RSpec.feature "Creating workout" do
  
  before do
    @john = User.create(email: "john@example.com", password: "password")
    login_as @john
  end
  
  scenario "with valid input" do
    visit "/"
    
    click_link "My Lounge"
    
    click_link "New Workout"
    
    expect(page).to have_link "Back"
    
    fill_in "Duration", with: 70
    fill_in "Details", with: "weight lifting"
    fill_in "Workout Date", with: "2015-08-31"
    click_button "Create Workout"
    
    expect(page).to have_content "Workout has been created"
    workout = Workout.last
    expect(current_path).to eq user_workout_path(@john, workout)
  end
  
end