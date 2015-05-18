class Post < ActiveRecord::Base
  belongs_to :project, dependent: :destroy
  has_many :comments, dependent: :destroy

  # All posts by a user
  scope :by_user, -> (user) {
    where(project_id: user.projects.pluck(:id))
  }
  # Posts that belong to projects that are followed by the user
  scope :followed, -> (user) { 
  	Post.where(project_id: (Project.where(id: Follow.where(user_id: user).pluck(:project_id))).pluck(:id)) 
  }
  # Posts that belong to projects that share tags with the user
  scope :tagged_by_user, -> (user) { 
  	where(project_id: (Project.tagged_with(user.tag_list, any: true)).pluck(:id)) 
  }

end
