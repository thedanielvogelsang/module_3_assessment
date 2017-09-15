require 'rails_helper'

describe 'bestbuy service api request' do
  it 'returns a hash of stores based on zipcode' do
    stores = BestBuyService.find_stores_by_location("80202")
    expect(stores.values.flatten.count).to eq(10)
    expect(stores.values.flatten.first.class).to eq(Store)
    store = stores.values.flatten.first
    expect(store.name).to be_truthy
  end

  it 'returns stores based on a latitude-longitude pair' do
    stores = BestBuyService.find_stores_by_location("25.767368,-80.18930")
    expect(stores.values.first.count).to eq(10)
    expect(stores.values.flatten.first.class).to eq(Store)
  end
end
