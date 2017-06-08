class Post < ActiveRecord::Base
  has_many :comments, dependent: :destroy #ensures comments get deleted with the associated post
end
