class ServicesController < ApplicationController
  include Cacheable

  def index
    params.delete(:age_range) if params[:age_range].eql?("0,16")

    @selected_ages = [0,16]
    @selected_ages = params[:age_range].split(',').collect { |a| a.to_i } if params[:age_range].present?

    @selected_categories = params[:category]
    @selected_categories ||= []

    @selected_days = params[:weekdays]
    @selected_days ||= []

    services = Service.search(params)
    @search = ServiceSearch.new(services, Ohanakapa.last_response, params)
    cache_page(services.max_by(&:updated_at).updated_at) if services.present?
  end

  def show
    id = params[:id].split('/').last
    @service = Service.get(id)
    @issues = Issue.where(service_id: id)
    cache_page(@service.updated_at) if @service.present?
  end

end
