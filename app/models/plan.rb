# frozen_string_literal: true

# == Schema Information
#
# Table name: plans
#
#  id         :bigint(8)        not null, primary key
#  action_id  :integer          default(0), not null
#  event_id   :integer          default(0), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Plan < ApplicationRecord
end
