# frozen_string_literal: true

module Logable
  extend ActiveSupport::Concern

  included do
    has_many :logs, dependent: :destroy, as: :logable
    accepts_nested_attributes_for :logs, allow_destroy: true, reject_if: :all_blank
  end
end
