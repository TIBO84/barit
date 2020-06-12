module ApplicationHelper
  def back_button_path(search)
    if search.blank?
      root_path
    else
      bars_path(city: search)
    end
  end

  def owner?(user)
    user.bars.any?
  end

  def renter?(user)
    user.reservations.any?
  end

  def address(bar)
    return "#{bar.address}, #{bar.city}"
  end

  def total_reservations(bar)
    x = 0
    bar.reservations.each do |r|
      x +=1
    end
    return x
  end

  def next_reservation(bar)
    if bar.reservations.any?
      bar.reservations.sort{ |a,b| a.date <=> b.date }.first.date
    else
      return "--"
    end
  end

  def rating(bar)
    ratings = []
    if bar.reviews.any?
      bar.reviews.each do |review|
        ratings << review.rating
      end
    end
    if ratings != []
      average = ratings.sum / ratings.size.to_f
      return "#{average.round(1)} / 5"
    else
      return "- / 5"
    end
  end
end
