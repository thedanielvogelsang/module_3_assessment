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
end
