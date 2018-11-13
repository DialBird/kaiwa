# frozen_string_literal: true

module EventDecorator
  def display_date
    date.strftime('%Y/%m/%d')
  end
end
