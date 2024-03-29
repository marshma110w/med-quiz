# == Schema Information
#
# Table name: users
#
#  id              :bigint           not null, primary key
#  education       :string
#  email           :string           not null
#  name            :string           not null
#  password_digest :string
#  phone_number    :string
#  place_of_work   :string
#  specialization  :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
# Indexes
#
#  index_users_on_email  (email) UNIQUE
#
class User < ApplicationRecord
  attr_accessor :old_password

  has_many :attempts, dependent: :destroy

  has_secure_password validations: false

  validate :password_presence
  validate :correct_old_password, on: :update, if: -> { password.present? }
  validates :password, confirmation: true, allow_blank: true,
                       length: { minimum: 8, maximum: 70 }
  validate :password_complexity

  validates :email, uniqueness: { case_sensetive: false }
  validates :name, presence: true
  validates :name, length: { in: 3..40 }
  validates :email, presence: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }

  before_validation :downcase_email

  private

  def correct_old_password
    return if BCrypt::Password.new(password_digest_was).is_password?(old_password)

    errors.add :old_password, 'is incorrect'
  end

  def password_presence
    errors.add(:password, :blank) if password_digest.blank?
  end

  def password_complexity
    # Regexp extracted from https://stackoverflow.com/questions/19605150/regex-for-password-must-contain-at-least-eight-characters-at-least-one-number-a
    return if password.blank? || password =~ /(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-])/

    errors.add :password,
               'complexity requirement not met. Length should be 8-70 characters and include: 1 uppercase, 1 lowercase,
               1 digit and 1 special character'
  end

  def downcase_email
    email&.downcase!
  end
end
