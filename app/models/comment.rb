class Comment < ActiveRecord::Base
  belongs_to :post

  validates :comment, :presence => true
  validates :commenter, :presence => true
end
