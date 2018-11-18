# frozen_string_literal: true

# == Schema Information
#
# Table name: goals
#
#  id         :bigint(8)        not null, primary key
#  user_id    :integer          default(0), not null
#  title      :string           default(""), not null
#  detail     :text             default(""), not null
#  is_clear   :boolean          default(FALSE), not null
#  limit_date :date
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Goal < ApplicationRecord
  ATTRIBUTES = %i[user_id title detail limit_date].freeze

  belongs_to :user
  has_many :actions, dependent: :destroy, inverse_of: :goal
  has_many :events, -> { order(created_at: :asc) }, dependent: :destroy, inverse_of: :goal

  validates :title, presence: true
end
