# frozen_string_literal: true

module ApplicationHelper
  def default_meta_tags
    {
      charset: 'utf-8',
      title: 'Kaiwa',
      viewport: 'width=device-width, initial-scale=1.0'
    }
  end

  def display_flash
    flash.each do |type, msg|
      # Deviseのセッションタイムアウト時のflashは無視する
      next if type == 'timedout'

      type = 'success' if type == 'notice'
      type = 'error' if %w[alert danger].include? type

      concat content_tag(:script, "toastr.#{type}(\"#{msg}\");".html_safe)
    end
    nil
  end
end
