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
require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
