module ApplicationHelper

  WEEKDAYS = %w(Monday Tuesday Wednesday Thursday Friday Saturday Sunday).freeze

  def array_to_weekdays(arr)
    arr.collect { |e| WEEKDAYS[e.to_i - 1] }
  end

end
