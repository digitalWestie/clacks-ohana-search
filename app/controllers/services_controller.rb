class ServicesController < ApplicationController
  include Cacheable

  def index
    locations = Location.search(params)
    @search = Search.new(locations, Ohanakapa.last_response, params)
    cache_page(locations.max_by(&:updated_at).updated_at) if locations.present?
  end

  def show
  end
end
