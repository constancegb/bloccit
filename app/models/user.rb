class User < ActiveRecord::Base

  has_many :posts, dependent: :destroy #dependent: :destroy ensures each model get deleted when the user is deleted
  has_many :comments, dependent: :destroy
  has_many :votes, dependent: :destroy
  has_many :favorites, dependent: :destroy

  before_save { self.email = email.downcase if email.present? } #between {} will run when the inline callback executes.
  #shorthand for self.role = :member if self.role.nil?
  before_save { self.role ||= :member } #allows to use the role column as an enum?

  validates :name, length: { minimum: 1, maximum: 100 }, presence: true

  validates :password, presence: true, length: { minimum: 6 }, if: "password_digest.nil?"
  validates :password, length: { minimum: 6 }, allow_blank: true

  validates :email,
             presence: true,
             uniqueness: { case_sensitive: false },
             length: { minimum: 3, maximum: 254 }

   has_secure_password #mechanism requiring password_digest attribute".

   enum role: [:member, :admin]

#uses where to retrieve user's favorites with post_id matching post.id. If favorited, will return array of 1 item
   def favorite_for(post)
     favorites.where(post_id: post.id).first
   end

end
