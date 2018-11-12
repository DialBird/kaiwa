# frozen_string_literal: true

# == Schema Information
#
# Table name: logs
#
#  id           :bigint(8)        not null, primary key
#  logable_type :string
#  logable_id   :bigint(8)                              # ポリモーフィックID
#  event_id     :integer          default(0), not null
#  memo         :text             default(""), not null
#  star         :integer          default(0), not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Log < ApplicationRecord
  belongs_to :logable, polymorphic: true
end
