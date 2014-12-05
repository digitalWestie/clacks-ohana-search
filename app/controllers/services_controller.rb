class ServicesController < ApplicationController
  include Cacheable

  def index
    services = Service.search(params)
    @search = ServiceSearch.new(services, Ohanakapa.last_response, params)
    cache_page(services.max_by(&:updated_at).updated_at) if services.present?
  end

  def show
    id = params[:id].split('/').last
    @service = Service.get(id)
    # @keywords = @location.services.map { |s| s[:keywords] }.flatten.compact.uniq
    #@categories = @location.services.map { |s| s[:categories] }.flatten.compact.uniq
    cache_page(@service.updated_at) if @service.present?
  end

end
