class Store
  attr_reader :name, :city, :distance, :phone, :type
  def initialize(store_hash)
    @id = store_hash['storeId']
    @type = store_hash['storeType']
    @name = store_hash['name']
    @city = store_hash['city']
    @distance = store_hash['distance']
    @phone = store_hash['phone']
  end

  def self.find_stores_by_location(location)
    store_hash = BestBuyService.find_stores_by_location(location)
    @stores = store_hash.values.first
  end

  def self.find_total_nearby_stores(location)
    store_hash = BestBuyService.find_stores_by_location(location)
    @total = store_hash.keys.first
  end
end
