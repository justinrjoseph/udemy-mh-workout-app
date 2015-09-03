require 'rails_helper'

RSpec.feature "Deleting workouts" do
  
  before do
    @owner = User.create(email: "owner@example.com", password: "password")
    
    @owner_workout = @owner.workouts.create!(duration: 48, details: "Cardio
                                             special", date: Date.today)
    
    login_as @owner
  end
  
  scenario do
    visit "/"
    
    click_link "My Lounge"
    
    link = "//a[contains(@href, '/users/#{@owner.id}/workouts/#{@owner_workout.id}') and .//text()='Delete']"
    
    find(:xpath, link).click
    
    expect(page).to have_content "Workout deleted"
    expect(page).not_to have_content 48
    expect(page).not_to have_content "Cardio special"
  end

end