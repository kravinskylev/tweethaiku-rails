require 'test_helper'

class UserCreatesAccountTest < ActionDispatch::IntegrationTest
  include Capybara::DSL

  test 'existing user can create account' do
    user = User.create(username: "Lev",
                       password: "password")

    visit login_path
    fill_in "Username", with: "Lev"
    fill_in "Password", with: "password"
    click_button "Login"

    assert page.has_content?("Welcome, Lev")
  end
end
