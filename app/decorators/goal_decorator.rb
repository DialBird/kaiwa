# frozen_string_literal: true

module GoalDecorator
  def display_title
    current_goal? ? "#{title}（現在の目標）" : title
  end

  def display_limit
    limit_date ? limit_date.strftime('%Y/%m/%d') : 'なし'
  end
end
