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
#  aasm_state             :string           default(""), not null
#  uid                    :string           default(""), not null
#  provider               :string           default(""), not null
#  last_name              :string           default(""), not null
#  first_name             :string           default(""), not null
#  nick_name              :string           default(""), not null
#

class User < ApplicationRecord
  include AASM

  ATTRIBUTES = %i[last_name first_name nick_name].freeze

  aasm do
    state :nick_name_settings_required
    state :goal_settings_required
    state :settings_completed

    event :nick_name_settings_completed do
      transitions from: :nick_name_settings_required, to: :goal_settings_required
    end

    event :goal_settings_completed do
      transitions from: :goal_settings_required, to: :settings_completed
    end
  end

  devise :omniauthable, omniauth_providers: %i[facebook]

  has_many :goals, -> { order(created_at: :asc) }, dependent: :destroy, inverse_of: :user

  accepts_nested_attributes_for :goals, allow_destroy: true, reject_if: :all_blank

  validates :nick_name,  presence: true, if: :nick_name_changed?
  validates :last_name,  presence: true, if: :last_name_changed?
  validates :first_name, presence: true, if: :first_name_changed?
  validate :uid_and_provider_must_be_unique, on: :create

  class << self
    def from_omniauth(auth)
      where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
        user.email = auth.info.email || ''
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
