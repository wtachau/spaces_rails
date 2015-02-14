class Post < ActiveRecord::Base
  belongs_to :user
  acts_as_taggable
  has_many :comments
  has_many :follows
end
