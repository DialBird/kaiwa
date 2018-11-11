# frozen_string_literal: true

# == Schema Information
#
# Table name: goals
#
#  id         :bigint(8)        not null, primary key
#  title      :string           default(""), not null
#  detail     :text             default(""), not null
#  limit_date :date
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Goal < ApplicationRecord
end
