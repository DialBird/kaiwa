# frozen_string_literal: true

module ApplicationHelper
  def default_meta_tags
    {
      charset: 'utf-8',
      title: 'Kaiwa',
      viewport: 'width=device-width, initial-scale=1.0'
    }
  end
end
