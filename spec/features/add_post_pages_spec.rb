require 'rails_helper'

describe "the add a post process" do
  it "adds a new post", js: true do
    user = FactoryGirl.create(:user)
    visit '/'
    click_on 'Login'
    fill_in 'Email', :with => 'dog@world.com'
    fill_in 'Password', :with => '12345678'
    click_on 'Log in'
    click_on 'NEW POST'
    fill_in 'Title', :with => 'Bark!'
    fill_in 'Body', :with => 'The cat is a bitch.'
    click_on 'Create Post'
    expect(page).to have_content 'Bark!'
  end

  it "gives error when no title is entered", js: true do
    user = FactoryGirl.create(:user)
    visit new_user_session_path
    fill_in 'Email', :with => 'dog@world.com'
    fill_in 'Password', :with => '12345678'
    click_on 'Log in'
    click_on 'NEW POST'
    fill_in 'Title', :with => 'Bark!'
    fill_in 'Body', :with => ''
    click_on 'Create Post'
    expect(page).to have_content "Body can't be blank"
  end

  it "gives error when no body is entered", js: true do
    user = FactoryGirl.create(:user)
    visit new_user_session_path
    fill_in 'Email', :with => 'dog@world.com'
    fill_in 'Password', :with => '12345678'
    click_on 'Log in'
    click_on 'NEW POST'
    fill_in 'Title', :with => ''
    fill_in 'Body', :with => 'The cat is a bitch'
    click_on 'Create Post'
    expect(page).to have_content "Title can't be blank"
  end

end
