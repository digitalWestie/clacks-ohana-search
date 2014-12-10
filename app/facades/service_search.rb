class ServiceSearch
  include AddressFormatHelper
  include Rails.application.routes.url_helpers

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
      hash_for(av.location, service)
    end.compact
  end

  def hash_for(location, service)
    {
      latitude: location.latitude,
      longitude: location.longitude,
      name: location.name,
      slug: location.slug,
      service: service.id,
      service_name: service.name,
      service_path: service_path(service.id),
      street_address: street_address_for(location.address),
      city: location.address.city
    }
  end

  def results
    Paginator.new(@response, @params).results
  end

end
