require 'rails_helper'
RSpec.describe Store, type: :model do
  context 'attr readers' do
    it 'initializes with a hash' do
      store = Store.new({})
      assert_instance_of Store, store
    end
    it 'creates a store with name' do
      store = Store.new({'name' => "Store Name"})
      assert_equal "Store Name", store.name
    end
    it 'can not create a store with symboled hash' do
      store = Store.new({name: "Store Name"})
      assert_nil store.name
    end
    it 'can store name, id, city, distance, phone, type' do
      store = Store.new({'name' => 'store',
                        'city' => 'Denver',
                        'storeId' => 1,
                        'storeType' => 'commercial giant',
                        'distance' => '25 mi.',
                        'phone' => '3162070000'})
      expect(store.class).to eq(Store)
      assert_equal 'store', store.name
      assert_equal 'Denver', store.city
      assert_equal 'commercial giant', store.type
      assert_equal 1, store.id
      assert_equal '3162070000', store.phone
      assert_equal '25 mi.', store.distance
    end
  end
  context 'api bestbuyservice calls' do
    it 'can find nearby stores based on location' do
      stores = Store.find_stores_by_location("80216")
      expect(stores.first.city).to eq("Denver")
      expect(stores.first).to respond_to(:name)
    end
    it 'can find total number of nearby stores based on location' do
      total = Store.find_total_nearby_stores("80216")
      expect(total.class).to eq(Fixnum)
    end
  end
end
