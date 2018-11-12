# frozen_string_literal: true

# == Schema Information
#
# Table name: habits
#
#  id         :bigint(8)        not null, primary key
#  user_id    :integer          default(0), not null
#  title      :string           default(""), not null
#  memo       :text             default(""), not null
#  is_clear   :boolean          default(FALSE), not null
#  logs_count :integer          default(0), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Habit < ApplicationRecord
  ATTRIBUTES = %i[title memo is_clear].freeze

  belongs_to :user

  validates :title, presence: true
end
