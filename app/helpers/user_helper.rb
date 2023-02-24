
# Helpers are modules that define methods that can be used in views to provide reusable code for common view-related tasks.
# Helpers are typically used to keep the logic in views simple and easy to read, by encapsulating complex or repetitive view-related tasks in helper methods.

# This UserHelper module is included in application_controller and used in _user.json.jbuilder partial in users view
module UserHelper

  def format_name(user)
    if user.gender == 1
      "Mr. #{user.first_name} #{user.last_name}"
    elsif user.gender == 0
      "Ms. #{user.first_name} #{user.last_name}"
    else
      "#{user.first_name} #{user.last_name}"
    end
  end

  def format_height(user)
    if user.height.present?
      "#{user.height} cm"
    else
      nil
    end
  end

  def format_weight(user)
    if user.weight.present?
      "#{user.weight} kg"
    else
      nil
    end
  end

  def format_gender(user)
    if user.gender.present?
      GENDER_OPTIONS[user.gender]
    else
      nil
    end
  end

end