class User < ActiveRecord::Base
  before_save { self.email = email.downcase if email.present?
                self.name = name.split.each{ |word| word.capitalize! }.join(" ") if name.present?
  } #between {} will run when the inline callback executes.


  validates :name, length: { minimum: 1, maximum: 100 }, presence: true

  validates :password, presence: true, length: { minimum: 6 }, if: "password_digest.nil?"
  validates :password, length: { minimum: 6 }, allow_blank: true

  validates :email,
             presence: true,
             uniqueness: { case_sensitive: false },
             length: { minimum: 3, maximum: 254 }

  has_secure_password #mechanism requiring password_digest attribute".
end
