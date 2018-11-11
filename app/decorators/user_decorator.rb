# frozen_string_literal: true

module UserDecorator
  def current_goal
    goals.last.title
  end

  def full_name
    "#{last_name} #{first_name}"
  end
end
