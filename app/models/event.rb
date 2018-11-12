# frozen_string_literal: true

# == Schema Information
#
# Table name: events
#
#  id         :bigint(8)        not null, primary key
#  user_id    :integer          default(0), not null
#  title      :string           default(""), not null
#  memo       :text             default(""), not null
#  star       :integer          default(0), not null
#  review     :text             default(""), not null
#  date       :datetime
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Event < ApplicationRecord
  ATTRIBUTES = %i[title memo star review date].freeze

  belongs_to :user
  has_many :logs, dependent: :destroy, as: :event

  validates :title, presence: true
  validates :date,  presence: true
end
