class BestBuyService

  def initialize
    @conn = Faraday.new("https://api.bestbuy.com") do |faraday|
      faraday.headers['X-API-KEY'] = ENV['x-api-key']
      faraday.adapter Faraday.default_adapter
    end
  end

  def self.find_stores_by_location(location)
    new.find_stores_by_location(location)
  end

  def find_stores_by_location(location)
    response = @conn.get("/v1/stores(area(#{location},25))?format=json&show=storeId,storeType,name,city,distance,phone&apiKey=#{ENV['x-api-key']}")
    stores_json = parse(response)
    stores = stores_json['stores'].map{|store| Store.new(store)}
    hash = {stores_json['total'] => stores}
  end

  private
    def parse(json_hash)
      JSON.parse(json_hash.body)
    end
end
