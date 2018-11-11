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
  ATTRIBUTES = %i[last_name first_name nick_name].freeze

  devise :omniauthable, omniauth_providers: %i[facebook]

  validates :nick_name,  presence: true
  validates :last_name,  presence: true, if: :last_name_changed?
  validates :first_name, presence: true, if: :first_name_changed?
  validate :uid_and_provider_must_be_unique, on: :create

  class << self
    def from_omniauth(auth)
      where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
        user.email = auth.info.email || ''
        user.password = Devise.friendly_token[0, 20]
        user.last_name = auth.info.last_name || ''
        user.first_name = auth.info.first_name || ''
      end
    end
  end

  private

  def uid_and_provider_must_be_unique
    return unless User.exists?(uid: uid, provider: provider)

    errors.add(:base, I18n.t('errors.messages.registered_account'))
  end
end
