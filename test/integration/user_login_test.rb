require 'test_helper'

class UserLoginTest < ActionDispatch::IntegrationTest
    include Capybara::DSL
  test 'user can loign to account' do
    visit new_user_path
    fill_in "Username", with: "Lev"
    fill_in "Password", with: "password"
    click_button "Create Account"

    assert page.has_content?("Welcome, Lev!")
  end
end
