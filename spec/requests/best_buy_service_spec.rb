require 'rails_helper'

describe 'bestbuy service api request' do
  it 'returns stores based on zipcode' do
    stores = BestBuyService.find_stores_by_zip("80202")
    byebug
  end
end
