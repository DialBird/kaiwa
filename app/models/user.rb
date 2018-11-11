# frozen_string_literal: true

# == Schema Information
#
# Table name: users
#
#  id                     :bigint(8)        not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :inet
#  last_sign_in_ip        :inet
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  uid                    :string           default(""), not null
#  provider               :string           default(""), not null
#  last_name              :string           default(""), not null
#  first_name             :string           default(""), not null
#  nick_name              :string           default(""), not null
#

class User < ApplicationRecord
  devise :omniauthable, omniauth_providers: %i[facebook]
end
