module ApplicationHelper
  def format_date(date, format = :default)
    date.blank? ? '--' : l(date, format: format)
  end
end
