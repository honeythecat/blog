require 'rails_helper'

describe "the add a comment process" do
  it "adds a new comment", js: true do
    user = FactoryGirl.create(:user)
    visit new_user_session_path
    click_on 'Login'
    fill_in 'Email', :with => 'dog@world.com'
    fill_in 'Password', :with => '12345678'
    click_on 'Log in'
    post = FactoryGirl.create(:post)
    visit new_user_session_path
    click_on 'Bark!'
    click_on 'Add a comment!'
    fill_in 'Commenter', :with => 'DOG'
    fill_in 'Comment', :with => 'Serioulsy! The cat tried to kill me.'
    click_on 'Create Comment'
    expect(page).to have_content 'Serioulsy! The cat tried to kill me.'
  end

  it "gives error when no commenter is entered", js: true do
    user = FactoryGirl.create(:user)
    visit new_user_session_path
    fill_in 'Email', :with => 'dog@world.com'
    fill_in 'Password', :with => '12345678'
    click_on 'Log in'
    post = FactoryGirl.create(:post)
    visit new_user_session_path
    click_on 'Bark!'
    click_on 'Add a comment!'
    fill_in 'Commenter', :with => ''
    fill_in 'Comment', :with => 'Serioulsy! The cat tried to kill me.'
    click_on 'Create Comment'
    expect(page).to have_content "Commenter can't be blank"
  end

  it "gives error when no comment is entered", js: true do
    user = FactoryGirl.create(:user)
    visit new_user_session_path
    fill_in 'Email', :with => 'dog@world.com'
    fill_in 'Password', :with => '12345678'
    click_on 'Log in'
    post = FactoryGirl.create(:post)
    visit new_user_session_path
    click_on 'Bark!'
    click_on 'Add a comment!'
    fill_in 'Commenter', :with => 'DOG'
    fill_in 'Comment', :with => ''
    click_on 'Create Comment'
    expect(page).to have_content "Comment can't be blank"
  end

end
