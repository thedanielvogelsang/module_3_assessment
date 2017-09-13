class SearchController < ApplicationController
  def index
    @zipcode = params[:zipcode]
    @stores = BestBuyService.find_stores_by_zip(@zipcode)
  end
end
