class User < ApplicationRecord
  has_secure_password

  has_many :questions, foreign_key: :questioner_id
  has_many :answers, foreign_key: :answerer_id
  has_many :comments, foreign_key: :commenter_id
  has_many :votes, foreign_key: :voter_id

  def self.authenticate(login_email, login_password)
    @user = User.find_by(email: login_email)
    if !@user
      nil
    elsif @user.password == login_password
      @user
    elsif @user.password != login_password
      nil
    end
  end
end
