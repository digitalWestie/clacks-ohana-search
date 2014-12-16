class Service
  # Calls the search endpoint of the Ohana API.
  #
  # @param params [Hash] Search options.
  # @return [Array] Array of services.
  def self.search(params = {})
    unless ENV['APP_CATEGORIES'].blank?
      begin
        ancestry_categories = ENV['APP_CATEGORIES']
        ancestry_categories = JSON.parse(ENV['APP_CATEGORIES']) if ENV['APP_CATEGORIES'].eql?(String)
        params[:category_ancestor] = ancestry_categories
      rescue
        Rails.logger.warn "Couldn't setup params[category_ancestor]. Make sure all top or mid level categories are defined in application.yml or config. \n Object: #{ancestry_categories}\n"
      end
    end
    Ohanakapa.search('search/services', params)
  end

  def self.get(id)
    Ohanakapa.get("services/#{id}")
  end
end
