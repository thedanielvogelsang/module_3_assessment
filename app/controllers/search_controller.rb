class SearchController < ApplicationController
  def index
    @stores = Store.find_stores_by_location(params[:location]), serializer: StoreSerializer
    @total = Store.find_total_nearby_stores(params[:location])
    @location = params[:location]
  end
end
