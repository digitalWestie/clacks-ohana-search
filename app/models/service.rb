class Service
  # Calls the search endpoint of the Ohana API.
  #
  # @param params [Hash] Search options.
  # @return [Array] Array of services.
  def self.search(params = {})
    params[:prerequisite_category] = ENV['PREREQUISITE_CATEGORY'] unless ENV['PREREQUISITE_CATEGORY'].blank?
    Ohanakapa.search('search/services', params)
  end

  def self.get(id)
    Ohanakapa.get("services/#{id}")
  end
end
