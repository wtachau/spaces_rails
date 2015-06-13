class ProjectSerializer < ActiveModel::Serializer
	attributes :id, :name, :link, :created_at, :updated_at, :info, :user_id, :problem, :solution, :github, :dropbox, :time_ago, :tag_list
	
	has_one :user
	has_many :comments
end
