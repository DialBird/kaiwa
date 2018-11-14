# frozen_string_literal: true

# == Schema Information
#
# Table name: plans
#
#  id         :bigint(8)        not null, primary key
#  action_id  :integer          default(0), not null
#  event_id   :integer          default(0), not null
#  title      :string           default(""), not null
#  is_done    :boolean          default(FALSE), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Plan < ApplicationRecord
  ATTRIBUTES = %i[title].freeze

  belongs_to :action
  belongs_to :event

  validates :title, presence: true
end
