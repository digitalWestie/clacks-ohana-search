class Service
  # Calls the search endpoint of the Ohana API.
  #
  # @param params [Hash] Search options.
  # @return [Array] Array of services.
  def self.search(params = {})
    Ohanakapa.search('search/services', params)
  end

  #def self.get(id)
  #  Ohanakapa.location(id)
  #end
end
