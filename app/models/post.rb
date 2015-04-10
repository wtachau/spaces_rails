class Post < ActiveRecord::Base
  belongs_to :user, dependent: :destroy
  acts_as_taggable
  has_many :comments, dependent: :destroy
  has_many :follows, dependent: :destroy

  scope :followed, ->(user) { where(id: Follow.where(user_id: user).pluck(:post_id)) }
  scope :tagged_by_user, ->(user) { tagged_with(user.tag_list, any: true).order('updated_at DESC') }
  scope :has_tag, ->(tag) { tagged_with([tag], any: true).order('updated_at DESC') }
end
