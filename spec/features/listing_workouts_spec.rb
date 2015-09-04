require 'rails_helper'

RSpec.feature "A workouts list" do
  
  before do
    @john = User.create(first_name: "John", last_name: "Doe",
                        email: "john@example.com", password: "password")
    @sarah = User.create(first_name: "Sarah", last_name: "Joseph",
                         email: "sarah@example.com", password: "password")
    
    login_as @john
    
    @w1 = @john.workouts.create(duration: 20, details: "body-building routine",
                                date: Date.today)
    @w2 = @john.workouts.create(duration: 20, details: "cardio",
                                date: Date.today )
    
    @following = Friendship.create(user: @john, friend: @sarah)
  end
  
  scenario "shows a user's workouts for last seven days" do
    visit "/"
    
    click_link "My Lounge"
    
    expect(page).to have_content @w1.duration
    expect(page).to have_content @w1.details
    expect(page).to have_content @w1.date
    expect(page).to have_content @w2.duration
    expect(page).to have_content @w2.details
    expect(page).to have_content @w2.date
  end
  
  scenario "shows a user's friends" do
    visit "/"
    
    click_link "My Lounge"
    
    expect(page).to have_content "My Friends"
    expect(page).to have_link @sarah.full_name
    expect(page).to have_link "Unfollow"
  end
  
end