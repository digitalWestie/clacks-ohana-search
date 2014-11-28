class ServicesController < ApplicationController
  include Cacheable

  def index
    services = Service.search(params)
    @search = ServiceSearch.new(services, Ohanakapa.last_response, params)
    cache_page(services.max_by(&:updated_at).updated_at) if services.present?
  end

  def show
  end
end
