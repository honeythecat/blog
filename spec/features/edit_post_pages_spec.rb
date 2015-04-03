require 'rails_helper'

describe "the edit a post process" do
  it "edits a post", js: true do
    user = FactoryGirl.create(:user)
    visit new_user_session_path
    fill_in 'Email', :with => 'dog@world.com'
    fill_in 'Password', :with => '12345678'
    click_on 'Log in'
    post = FactoryGirl.create(:post)
    visit new_user_session_path
    click_on 'Bark!'
    click_on 'EDIT POST!!'
    fill_in 'Title', :with => 'BARK!!'
    fill_in 'Body', :with => 'The cat is a hell beast.'
    click_on 'Update Post'
    expect(page).to have_content "BARK!!"
  end

  it "gives an error if a title is edited to blank", js: true do
    user = FactoryGirl.create(:user)
    visit new_user_session_path
    fill_in 'Email', :with => 'dog@world.com'
    fill_in 'Password', :with => '12345678'
    click_on 'Log in'
    post = FactoryGirl.create(:post)
    visit new_user_session_path
    click_on 'Bark!'
    click_on 'EDIT POST!!'
    fill_in 'Title', :with => ''
    fill_in 'Body', :with => 'The cat is a hell beast.'
    click_on 'Update Post'
    expect(page).to have_content "Title can't be blank"
  end

  it "gives and error if a body is edited to blank", js: true do
    user = FactoryGirl.create(:user)
    visit new_user_session_path
    fill_in 'Email', :with => 'dog@world.com'
    fill_in 'Password', :with => '12345678'
    click_on 'Log in'
    post = FactoryGirl.create(:post)
    visit new_user_session_path
    click_on 'Bark!'
    click_on 'EDIT POST!!'
    fill_in 'Title', :with => 'BARK!!'
    fill_in 'Body', :with => ''
    click_on 'Update Post'
    expect(page).to have_content "Body can't be blank"
  end

  it "doesn't change anything if the form isn't changed", js: true do
    user = FactoryGirl.create(:user)
    visit new_user_session_path
    fill_in 'Email', :with => 'dog@world.com'
    fill_in 'Password', :with => '12345678'
    click_on 'Log in'
    post = FactoryGirl.create(:post)
    visit new_user_session_path
    click_on 'Bark!'
    click_on 'EDIT POST!!'
    fill_in 'Title', :with => 'Bark!'
    fill_in 'Body', :with => 'The cat is a bitch.'
    click_on 'Update Post'
    expect(page).to have_content 'The cat is a bitch.'
  end

  # Can't run the following test because poltergeist won't check multiple windows.
    # it "deletes a post", js: true do
    #   user = FactoryGirl.create(:user)
    #   visit new_user_session_path
    #   fill_in 'Email', :with => 'dog@world.com'
    #   fill_in 'Password', :with => '12345678'
    #   click_on 'Log in'
    #   post = FactoryGirl.create(:post)
    #   visit new_user_session_path
    #   click_on 'Bark!'
    #   click_on 'OK'
    #   expect(page).to have_content 'POST DELETED!!!'
    # end















end
