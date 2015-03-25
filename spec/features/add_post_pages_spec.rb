require 'rails_helper'

describe "the add a post process" do
  it "adds a new post" do
    visit posts_path
    click_on 'NEW POST'
    fill_in 'Title', :with => 'THIS IS A POST'
    fill_in 'Body', :with => 'THESE ARE THE WORDS IN A POST'
    click_on 'Create Post'
    expect(page).to have_content 'POSTS'
  end

end
