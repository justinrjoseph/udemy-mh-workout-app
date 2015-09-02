require 'rails_helper'

RSpec.feature "Editing workouts" do
  
  before do
    @owner = User.create(email: "owner@example.com", password: "password")
    
    @owner_workout = @owner.workouts.create!(duration: 45, details: "Cardio 
                                             Activity", date: Date.today)
    login_as @owner
  end

  scenario "succeeds with valid input" do
    visit "/"
    
    click_link "My Lounge"
    
    link = "a[href='/users/#{@owner.id}/workouts/#{@owner_workout.id}/edit']"
    
    find(link).click
    
    fill_in "Duration", with: 50
    click_button "Update Workout"
    
    expect(page).to have_content "Workout was updated"
    expect(page).to have_content 50
    expect(page).not_to have_content 45
  end
  
end