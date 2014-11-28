class ServiceSearch
  include AddressFormatHelper
  attr_reader :services

  def initialize(services, response, params)
    @services = services
    @response = response
    @params = params
  end

  def map_data
    availabilities = @services.collect {|s| s.availabilities}
    availabilities.flatten.map do |av|
      next if av.location.coordinates.blank?
      hash_for(av.location)
    end.compact
  end

  def hash_for(location)
    {
      latitude: location.latitude,
      longitude: location.longitude,
      name: location.name,
      slug: location.slug,
      street_address: street_address_for(location.address),
      city: location.address.city
    }
  end

  def results
    Paginator.new(@response, @params).results
  end

end
