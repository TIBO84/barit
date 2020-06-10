module ApplicationHelper

  def back_button_path(search)
    if search.blank?
      root_path
    else
      bars_path(city: search)
    end
  end
end
