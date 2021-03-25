class User < ApplicationRecord
  has_many :user_diaries, dependent: :destroy
  has_many :budgets, dependent: :destroy
  has_many :spending_plans, dependent: :destroy
  has_many :allow_sharings, dependent: :destroy
  has_secure_password

  validates :name, presence: true,
                   length: {maximum: Settings.user.name.max_length}
  validates :email, presence: true,
                    format: {with: Settings.user.password.regex},
                    uniqueness: true
  validates :password, presence: true,
                       length: {minimum: Settings.user.password.min_length}
  enum role: {user: 0, admin: 1}

  before_save :downcase_email

  private

  def downcase_email
    email.downcase!
  end
end
