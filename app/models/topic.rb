class Topic < ActiveRecord::Base
  has_many :posts

  scope :visible_to, -> (user) { user? scoped : where(public: true) }
end
