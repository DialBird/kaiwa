# frozen_string_literal: true

# == Schema Information
#
# Table name: episodes
#
#  id         :bigint(8)        not null, primary key
#  user_id    :integer          default(0), not null
#  title      :string           default(""), not null
#  content    :string           default(""), not null
#  star       :integer          default(0), not null
#  logs_count :integer          default(0), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Episode < ApplicationRecord
  ATTRIBUTES = %i[user_id title content star].freeze

  validates :title, presence: true
end
