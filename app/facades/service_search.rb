class ServiceSearch
  include AddressFormatHelper
  attr_reader :services

  def initialize(services, response, params)
    @services = services
    @response = response
    @params = params
  end

  def map_data
    locations = @services.collect { |s| locations_for(s) }.flatten
    locations
  end

  def locations_for(service)
    service.availabilities.map do |av|
      next if av.location.coordinates.blank?
      hash_for(av.location, service.id)
    end.compact
  end

  def hash_for(location, service_slug)
    {
      latitude: location.latitude,
      longitude: location.longitude,
      name: location.name,
      slug: location.slug,
      service: service_slug,
      street_address: street_address_for(location.address),
      city: location.address.city
    }
  end

  def results
    Paginator.new(@response, @params).results
  end

end
