# == Schema Information
#
# Table name: attempts
#
#  id         :bigint           not null, primary key
#  result     :json
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint
#
# Indexes
#
#  index_attempts_on_user_id  (user_id)
#
class Attempt < ApplicationRecord
    belongs_to :user
end
