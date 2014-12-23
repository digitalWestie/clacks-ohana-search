module ServicesHelper

  def age_range_for(service)
    unless service.min_age.eql?(0) and service.max_age.eql?(100)
      "(#{service.min_age}~#{service.max_age} years)"
    end
  end

  def categories_for(service)
    categories = service.categories.collect {|c| c.name }
    categories = categories + service.keywords
    categories.delete("Display & Apps")
    categories.delete(ENV['PREREQUISITE_CATEGORY']) unless ENV['PREREQUISITE_CATEGORY'].blank?
    categories.join(", ")
  end

  def addresses_for(service)
    addresses = service.availabilities.collect { |a| a.location.address }
    if addresses.size.eql?(1)
      content_tag(:address, full_address_for(addresses[0]))
    elsif addresses.size > 1
      content_tag(:address, "At #{addresses.size} locations.")
    else
      ""
    end
  end

  def result_name_for(service)
    locations = service.availabilities.collect { |a| a.location }
    if locations.size.eql?(1)
      "#{service.name} @ #{locations[0].name}"
    elsif locations.size > 1
      "#{service.name} (multiple locations)"
    else
      "#{service.name}"
    end
  end

end
