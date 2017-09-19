require 'rails_helper'

describe BestBuyService do
  before(:each) do
    @location = "80216"
  end
  context "service methods" do
    it 'initializes without argument' do
      service = BestBuyService.new
      assert_equal(service.class, BestBuyService)
    end
    it 'can find stores based on zipcode on model level' do
      stores = BestBuyService.find_stores_by_location(@location)
      assert_equal(stores.class, Hash)
      assert_equal(stores.keys.first.class, Fixnum)
      expect(stores).to respond_to(:values)
      expect(stores.values.first.first.class).to eq(Store)
      expect(stores.values.first.first.city).to eq("Denver")
    end
    it 'can find stores based on zipcode on instance level' do
      service = BestBuyService.new
      stores = service.find_stores_by_location(@location)
      expect(stores.class).to eq(Hash)
      expect(stores[17].first.class).to eq(Store)
    end
  end
end
