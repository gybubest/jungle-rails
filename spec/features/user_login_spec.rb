require 'rails_helper'

RSpec.feature "UserLogins",  type: :feature, js: true do
  # SETUP
  before :each do
    @user = User.create! name: 'Test User', email: 'testuser@test.com', password: 'testpassword', password_confirmation: 'testpassword'
  end

  scenario "User can login and will be taken to the home page after" do
    # ACT
    visit '/login'
    fill_in 'email', with: 'testuser@test.com'
    fill_in 'password', with: 'testpassword'
    find('input[name="commit"]').click

    # commented out b/c it's for debugging only
    save_and_open_screenshot('user_login.png')

    within('ul.navbar-right') { expect(page).to have_content 'Signed in as Test User'}
  end
end
