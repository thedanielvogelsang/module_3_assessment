class BestBuyService

  def initialize
    @conn = Faraday.new("https://api.bestbuy.com") do |faraday|
      faraday.headers['X-API-KEY'] = ENV['x-api-key']
      faraday.adapter Faraday.default_adapter
    end
  end

  def self.find_stores_by_zip(zipcode)
    new.find_stores_by_zip(zipcode)
  end

  def find_stores_by_zip(zipcode)
    response = Faraday.get("https://api.bestbuy.com/v1/stores(area(#{zipcode},25))?format=json&show=storeId,storeType,name,city,distance,phone&apiKey=#{ENV['x-api-key']}")
    stores_json = parse(response)
    stores = stores_json['stores'].map{|store| Store.new(store)}
    hash = {stores_json['total'] => stores}
  end

  private
    def parse(json_hash)
      JSON.parse(json_hash.body)
    end
end
