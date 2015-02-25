class Post < ActiveRecord::Base
  belongs_to :user, dependent: :destroy
  acts_as_taggable
  has_many :comments, dependent: :destroy
  has_many :follows, dependent: :destroy
end
