# frozen_string_literal: true

# == Schema Information
#
# Table name: habits
#
#  id         :bigint(8)        not null, primary key
#  user_id    :integer          default(0), not null
#  title      :string           default(""), not null
#  is_clear   :boolean          default(FALSE), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Habit < ApplicationRecord
end
