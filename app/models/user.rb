class User < ApplicationRecord
  has_secure_password

  validates :email, :username, presence: true, uniqueness: true

  has_many :questions, foreign_key: :questioner_id
  has_many :answers, foreign_key: :answerer_id
  has_many :comments, foreign_key: :commenter_id
  has_many :votes, foreign_key: :voter_id

end
