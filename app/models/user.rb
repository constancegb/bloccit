class User < ActiveRecord::Base

  has_many :posts
  has_many :comments

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
end
