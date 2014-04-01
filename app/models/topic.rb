class Topic < ActiveRecord::Base
  has_many :posts

  scope :visible_to, ->(user) { user ? all : where(public: true) }
end
