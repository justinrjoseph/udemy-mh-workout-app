require 'rails_helper'

RSpec.feature "Listing workouts" do
  
  before do
    @john = User.create(email: "john@example.com", password: "password")
    login_as @john
    
    @w1 = @john.workouts.create(duration: 20, details: "body-building routine",
                                date: "2015-08-31")
    @w2 = @john.workouts.create(duration: 20, details: "cardio",
                                date: "2015-09-01" )
  end
  
  scenario "shows user's workouts for last seven days" do
    visit "/"
    
    click_link "My Lounge"
    
    expect(page).to have_content @w1.duration
    expect(page).to have_content @w1.details
    expect(page).to have_content @w1.date
    expect(page).to have_content @w2.duration
    expect(page).to have_content @w2.details
    expect(page).to have_content @w2.date
    
    default_scope { where('date > ?', 7.days.ago).order(date: :desc) }
  end
  
end