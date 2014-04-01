class Post < ActiveRecord::Base
  has_many :comments, dependent: :destroy
  has_many :votes, dependent: :destroy
  has_many :favorites, dependent: :destroy
  belongs_to :user
  belongs_to :topic

  after_create :create_vote

  mount_uploader :image, ImageUploader

  def up_votes
    self.votes.where(value: 1).count
  end

  def down_votes
    self.votes.where(value: -1).count
  end

  def points
    self.votes.sum(:value).to_i
  end

  def update_rank
    age = (self.created_at - Time.new(1970,1,1)) / 86400
    new_rank = points + age

    self.update_attribute(:rank, new_rank)
  end

  default_scope { order('rank DESC') }
  scope :visible_to, ->(user) { user? scoped : joins(:topic).where('topics.public' => true)}

  private

  def create_vote
    user.votes.create(value: 1, post: self)
  end
  
end
