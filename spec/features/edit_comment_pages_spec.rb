require 'rails_helper'

# You should figure out why you can't get your FactoryGirl comment to work. For now you're doing it the long way.

describe "the edit a comment process" do
  it "edits a comment", js: true do
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
    fill_in 'Comment', :with => 'Seriously! The cat tried to kill me.'
    click_on 'Create Comment'
    click_on 'Edit Comment'
    fill_in 'Commenter', :with => 'CAT'
    fill_in 'Comment', :with => 'The dog tried to decapitate me.'
    click_on 'Update Comment'
    expect(page).to have_content "The dog tried to decapitate me."
  end

  it "gives an error if a commenter is edited to blank", js: true do
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
    fill_in 'Comment', :with => 'Seriously! The cat tried to kill me.'
    click_on 'Create Comment'
    click_on 'Edit Comment'
    fill_in 'Commenter', :with => ''
    fill_in 'Comment', :with => 'The dog tried to decapitate me.'
    click_on 'Update Comment'
    expect(page).to have_content "Commenter can't be blank"
  end

  it "gives an error if a comment is edited to blank", js: true do
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
    fill_in 'Comment', :with => 'Seriously! The cat tried to kill me.'
    click_on 'Create Comment'
    click_on 'Edit Comment'
    fill_in 'Commenter', :with => 'CAT'
    fill_in 'Comment', :with => ''
    click_on 'Update Comment'
    expect(page).to have_content "Comment can't be blank"
  end
end
