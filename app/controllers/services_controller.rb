class ServicesController < ApplicationController
  include Cacheable

  def index
    params.delete(:age_range) if params[:age_range].eql?("0,16")
    @selected_categories = params[:category]
    @selected_categories ||= []

    services = Service.search(params)
    @search = ServiceSearch.new(services, Ohanakapa.last_response, params)
    cache_page(services.max_by(&:updated_at).updated_at) if services.present?
  end

  def show
    id = params[:id].split('/').last
    @service = Service.get(id)
    cache_page(@service.updated_at) if @service.present?
  end

end
