# frozen_string_literal: true

# == Schema Information
#
# Table name: actions
#
#  id         :bigint(8)        not null, primary key
#  goal_id    :integer          default(0), not null
#  title      :string           default(""), not null
#  memo       :text             default(""), not null
#  star       :integer          default(0), not null
#  logs_count :integer          default(0), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Action < ApplicationRecord
  include Logable

  ATTRIBUTES = %i[goal_id title memo star].freeze

  belongs_to :goal

  validates :title, presence: true
end
