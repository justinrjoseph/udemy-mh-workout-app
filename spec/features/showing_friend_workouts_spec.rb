require 'rails_helper'

RSpec.feature "Show friend's workouts" do
  
  before do
    @john = User.create(first_name: "John", last_name: "Doe",
                        email: "john@example.com", password: "password")
    @sarah = User.create(first_name: "Sarah", last_name: "Joseph",
                         email: "sarah@example.com", password: "password")
    
    @w1 = @john.workouts.create(duration: 74, details: "Weight lifting routine",
                                date: Date.today)
    
    @w2 = @sarah.workouts.create(duration: 55, details: "Weight lifting routine",
                                 date: Date.today)
    
    login_as @john
    
    @following = Friendship.create(user: @john, friend: @sarah)
  end
  
  scenario "for last 7 days" do
    visit "/"
    
    click_link "My Lounge"
    click_link @sarah.full_name
    
    expect(page).to have_content "#{@sarah.full_name}'s Workouts"
    expect(page).to have_content @w2.details
    expect(page).to have_css "div#chart"
  end
  
end