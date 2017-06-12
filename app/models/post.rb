class Post < ActiveRecord::Base
  belongs_to :topic
  has_many :comments, dependent: :destroy #ensures comments get deleted with the associated post
end
