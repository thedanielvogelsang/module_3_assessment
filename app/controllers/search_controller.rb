class SearchController < ApplicationController
  def index
    @zipcode = params[:zipcode]
    store_hash = BestBuyService.find_stores_by_zip(@zipcode)
    @stores = store_hash.values.first
    @total = store_hash.keys.first
  end
end
