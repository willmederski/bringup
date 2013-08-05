module ApplicationHelper
  # Return the day of the week for the specified date.
  # 
  # date    - The DateTime during a week to use for calculation.
  # weekday - The Symbol name for the day of the week (ex. :mon, :tue) that
  #           represents the day we are trying to return.
  #
  # Returns the DateTime for the specified day of the specified week.
  def weekday_for_week(date, weekday)
    beginning_of_week = date.beginning_of_week

    weekdays = {
      mon: 0,
      tue: 1,
      wed: 2,
      thu: 3,
      fri: 4
    }

    beginning_of_week + weekdays[weekday].days
  end
end
