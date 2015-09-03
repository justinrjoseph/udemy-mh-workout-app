require 'rails_helper'

RSpec.feature "Users sign up" do
  
  scenario "with valid credentials" do
    visit "/"
    
    click_link "Sign Up"
    
    fill_in "First Name", with: "John"
    fill_in "Last Name", with: "Doe"
    fill_in "Email", with: "user@example.com"
    fill_in "Password", with: "password"
    fill_in "Password confirmation", with: "password"
    click_button "Sign up"
    
    expect(page).to have_content "You have signed up successfully"
    
    visit "/"
    
    expect(page).to have_content "John Doe"
  end
  
  scenario "with invalid credentials" do
    visit "/"
    
    click_link "Sign Up"
    
    fill_in "First Name", with: ""
    fill_in "Last Name", with: ""
    fill_in "Email", with: "user@example.com"
    fill_in "Password", with: "password"
    fill_in "Password confirmation", with: "password"
    click_button "Sign up"
    
    expect(page).to have_content "First name can't be blank"
    expect(page).to have_content "Last name can't be blank"
  end
  
end