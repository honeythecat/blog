require 'rails_helper'

describe "the edit a post process" do
  it "edits a post" do
    post = Post.create(:title => 'Test Post', :body => 'Test Body')
    visit post_path(post)
    click_on 'Edit Post'
    fill_in 'Title', :with => 'Real Post'
    fill_in 'Body', :with => 'Real Body'
    click_on 'Update Post'
    expect(page).to have_content 'successfully'
  end
end
